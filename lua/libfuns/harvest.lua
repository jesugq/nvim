do
  local FUNCTION = {}

  local last_base
  local last_commit
  local last_diff

  local function git_lines(args)
    local cmd = { 'git' }
    vim.list_extend(cmd, args)
    local lines = vim.fn.systemlist(cmd)
    return vim.v.shell_error, lines
  end

  local function notify_git(lines, title)
    vim.notify(table.concat(lines, '\n'), vim.log.levels.ERROR, { title = title or 'git diff' })
  end

  local function show_diff(lines, base, commit)
    last_base = base
    last_commit = commit
    last_diff = vim.deepcopy(lines)
    vim.cmd('enew')
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    vim.bo.filetype = 'diff'
    vim.api.nvim_win_set_cursor(0, { 1, 0 })
  end

  -- True when a first-parent merge between base and commit brings in commits
  -- that base does not contain (a staging sync landed in the middle of the
  -- range). A plain tree diff then shows those incoming files. GitHub's
  -- commit-range view does not: it keeps only the non-merge commits on the
  -- branch line.
  local function range_merges_outside_history(base, commit)
    local code, merges = git_lines({ 'rev-list', '--first-parent', '--merges', base .. '..' .. commit })
    if code ~= 0 then
      return nil, merges
    end

    for _, merge in ipairs(merges) do
      if merge ~= '' then
        local pcode, parents = git_lines({ 'rev-parse', merge .. '^@' })
        if pcode ~= 0 then
          return nil, parents
        end
        for i = 2, #parents do
          if parents[i] ~= '' then
            vim.fn.system({ 'git', 'merge-base', '--is-ancestor', parents[i], base })
            if vim.v.shell_error ~= 0 then
              return true
            end
          end
        end
      end
    end

    return false
  end

  local function tree_diff(base, commit)
    local code, lines = git_lines({ 'diff', base .. '...' .. commit, '--' })
    if code ~= 0 then
      notify_git(lines)
      return
    end
    show_diff(lines, base, commit)
  end

  -- Replay the branch line onto base, skipping merge commits, then diff that
  -- tree against base. This is the combined diff GitHub shows for a
  -- /pull/N/changes/A..B range.
  local function branch_line_diff(base, commit)
    local code, commits = git_lines({
      'rev-list', '--reverse', '--first-parent', '--no-merges', base .. '..' .. commit,
    })
    if code ~= 0 then
      notify_git(commits, 'git rev-list')
      return
    end

    local patches = {}
    for _, sha in ipairs(commits) do
      if sha ~= '' then
        local patch = vim.fn.system({ 'git', 'diff', '--binary', '--full-index', sha .. '^', sha })
        if vim.v.shell_error ~= 0 then
          notify_git(vim.split(patch, '\n', { plain = true }), 'git diff')
          return
        end
        if patch:find('^diff ', 1) or patch:find('\ndiff ', 1, true) then
          table.insert(patches, patch)
        end
      end
    end

    local idx = vim.fn.tempname()
    local prev_index = vim.env.GIT_INDEX_FILE
    local function restore_index()
      if prev_index == nil or prev_index == '' then
        vim.env.GIT_INDEX_FILE = nil
      else
        vim.env.GIT_INDEX_FILE = prev_index
      end
      vim.fn.delete(idx)
    end

    vim.env.GIT_INDEX_FILE = idx
    local read_code, read_lines = git_lines({ 'read-tree', base })
    if read_code ~= 0 then
      restore_index()
      notify_git(read_lines, 'git read-tree')
      return
    end

    for _, patch in ipairs(patches) do
      local applied = vim.system({ 'git', 'apply', '--cached', '--3way' }, { stdin = patch }):wait()
      if applied.code ~= 0 then
        restore_index()
        vim.notify((applied.stderr or '') .. (applied.stdout or ''), vim.log.levels.ERROR, { title = 'git apply' })
        return
      end
    end

    local diff_code, lines = git_lines({ 'diff', '--cached', base })
    restore_index()
    if diff_code ~= 0 then
      notify_git(lines)
      return
    end
    show_diff(lines, base, commit)
  end

  local function hunk_diff(base, commit)
    local merged_outside, err = range_merges_outside_history(base, commit)
    if merged_outside == nil then
      notify_git(err)
      return
    end

    if merged_outside then
      branch_line_diff(base, commit)
    else
      tree_diff(base, commit)
    end
  end

  local function ask_ref(prompt, default, cb)
    Snacks.input({ prompt = prompt, default = default }, function(value)
      value = vim.trim(value or '')
      if value == '' or value == 'origin/' then
        return
      end

      cb(value)
    end)
  end

  local function clipboard_path()
    local info = vim.fn.getreg('+')
    if info == '' then
      info = vim.fn.getreg('"')
    end
    return vim.trim(info)
  end

  local function parse_path(info)
    local path, start_line, end_line = info:match('^(.*):(%d+)%-(%d+)$')
    if path then
      return path, tonumber(start_line), tonumber(end_line)
    end

    path, start_line = info:match('^(.*):(%d+)$')
    if path then
      local line = tonumber(start_line)
      return path, line, line
    end

    return info, nil, nil
  end

  local function select_lines(start_line, end_line)
    local last = vim.api.nvim_buf_line_count(0)
    start_line = math.max(1, math.min(start_line, last))
    end_line = math.max(1, math.min(end_line, last))

    if start_line > end_line then
      start_line, end_line = end_line, start_line
    end

    -- Reusing a checkout stays in the buffer, so a previous linewise selection
    -- is still active. `V` would toggle it off instead of selecting the new line.
    local mode = vim.fn.mode()
    if mode == 'v' or mode == 'V' or mode == '\22' then
      vim.cmd('normal! \27')
    end

    vim.api.nvim_win_set_cursor(0, { start_line, 0 })
    vim.cmd('normal! V')
    if end_line ~= start_line then
      vim.api.nvim_win_set_cursor(0, { end_line, 0 })
    end
  end

  local function read_clipboard()
    local info = clipboard_path()
    if info == '' then
      vim.notify('Clipboard is empty', vim.log.levels.WARN, { title = 'git show' })
      return nil
    end

    return info
  end

  local function require_commit()
    if not last_commit then
      vim.notify('No commit from hunk compare', vim.log.levels.WARN, { title = 'git show' })
      return false
    end

    return true
  end

  local function git_path(path)
    path = path:gsub('/+$', '')
    local code, lines = git_lines({ 'rev-parse', '--show-toplevel' })
    if code ~= 0 or not lines[1] or lines[1] == '' then
      return path
    end

    local root = vim.fs.normalize(lines[1])
    local normalized = vim.fs.normalize(path)
    if normalized == root then
      return ''
    end

    local prefix = root .. '/'
    if normalized:sub(1, #prefix) == prefix then
      return normalized:sub(#prefix + 1)
    end

    return (path:gsub('^%./', ''))
  end

  local function object_kind(path)
    if path == '' then
      return 'tree'
    end

    local code, lines = git_lines({ 'cat-file', '-t', '--', last_commit .. ':' .. path })
    if code ~= 0 then
      return nil, lines
    end

    return lines[1]
  end

  -- Checkout names are `commit:path`. Neovim stores them as `{cwd}/commit:path`.
  -- bufnr() treats the name as a pattern and can return a longer path under
  -- the same prefix, so match the expanded name exactly.
  local function checkout_buffer(name)
    local suffix = '/' .. name
    for _, candidate in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_valid(candidate) then
        local bufname = vim.fs.normalize(vim.api.nvim_buf_get_name(candidate))
        if bufname == name or bufname:sub(-#suffix) == suffix then
          return candidate
        end
      end
    end
  end

  local function fill_checkout(buf, lines)
    vim.bo[buf].modifiable = true
    vim.bo[buf].swapfile = false
    vim.bo[buf].bufhidden = 'hide'
    vim.bo[buf].buftype = 'nofile'
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    vim.bo[buf].modified = false
  end

  local function focus_checkout(buf)
    if vim.api.nvim_get_current_buf() ~= buf then
      vim.cmd.buffer(buf)
    end
  end

  -- Returns true when an already loaded checkout was refocused and its text
  -- was left in place.
  local function open_buffer(lines, name)
    if #lines == 0 then
      lines = { '' }
    end

    local function reuse(buf)
      local loaded = vim.api.nvim_buf_is_loaded(buf)
      focus_checkout(buf)
      if loaded then
        vim.bo[buf].swapfile = false
        vim.bo[buf].bufhidden = 'hide'
        vim.bo[buf].buftype = 'nofile'
        return true
      end

      fill_checkout(buf, lines)
      return false
    end

    local existing = checkout_buffer(name)
    if existing then
      return reuse(existing)
    end

    vim.cmd('enew')
    local buf = vim.api.nvim_get_current_buf()
    fill_checkout(buf, lines)
    if pcall(vim.api.nvim_buf_set_name, buf, name) then
      vim.bo[buf].modified = false
      return false
    end

    local dup = checkout_buffer(name)
    if dup and dup ~= buf then
      local kept = reuse(dup)
      vim.api.nvim_buf_delete(buf, { force = true })
      return kept
    end

    return false
  end

  local function show_blob(path, start_line, end_line)
    local code, lines = git_lines({ 'show', last_commit .. ':' .. path })
    if code ~= 0 then
      notify_git(lines, 'git show')
      return
    end

    local reused = open_buffer(lines, last_commit .. ':' .. path)
    vim.bo.filetype = vim.filetype.match({ filename = path }) or vim.bo.filetype

    if start_line then
      local from_line = start_line
      local to_line = end_line or start_line
      vim.schedule(function()
        select_lines(from_line, to_line)
      end)
    elseif not reused then
      vim.api.nvim_win_set_cursor(0, { 1, 0 })
    end
  end

  local function show_tree(path, cursor_name)
    local spec = last_commit
    if path ~= '' then
      spec = last_commit .. ':' .. path
    end

    local code, lines = git_lines({ 'ls-tree', '--name-only', spec })
    if code ~= 0 then
      notify_git(lines, 'git ls-tree')
      return
    end

    local label = path == '' and last_commit or (last_commit .. ':' .. path)
    open_buffer(lines, label)

    local row = 1
    if cursor_name then
      for i, line in ipairs(lines) do
        if line == cursor_name then
          row = i
          break
        end
      end
    end

    local count = vim.api.nvim_buf_line_count(0)
    vim.api.nvim_win_set_cursor(0, { math.max(1, math.min(row, count)), 0 })
  end

  local function open_kind(path, start_line, end_line)
    local kind, err = object_kind(path)
    if not kind then
      notify_git(err, 'git show')
      return
    end

    if kind == 'tree' then
      show_tree(path)
      return
    end

    if kind ~= 'blob' then
      vim.notify('Not a file: ' .. path, vim.log.levels.WARN, { title = 'git show' })
      return
    end

    show_blob(path, start_line, end_line)
  end

  FUNCTION.hunk_compare = function(default)
    ask_ref('Base', default, function(base)
      ask_ref('Commit', default, function(commit)
        hunk_diff(base, commit)
      end)
    end)
  end

  FUNCTION.hunk_assign = function(default)
    ask_ref('Commit', default, function(commit)
      last_commit = commit
    end)
  end

  FUNCTION.hunk_filename = function()
    if not require_commit() then
      return
    end

    local info = read_clipboard()
    if not info then
      return
    end

    open_kind(git_path(info))
  end

  FUNCTION.hunk_line = function()
    if not require_commit() then
      return
    end

    local info = read_clipboard()
    if not info then
      return
    end

    local raw, start_line, end_line = parse_path(info)
    open_kind(git_path(raw), start_line, end_line)
  end

  FUNCTION.hunk_dd = function()
    vim.cmd('enew')
  end

  FUNCTION.hunk_yy = function()
    if not last_base or not last_diff then
      vim.notify('No compare to yank', vim.log.levels.WARN, { title = 'git diff' })
      return
    end

    local lines = last_diff
    if #lines == 0 then
      lines = { '' }
    end

    vim.cmd('enew')
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    vim.bo.filetype = 'diff'
    vim.api.nvim_win_set_cursor(0, { 1, 0 })
  end

  return FUNCTION
end
