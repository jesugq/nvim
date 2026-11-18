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

  local function notify_harvest(kind, path)
    local shown = (path == nil or path == '') and last_commit or (last_commit .. ':' .. path)
    vim.notify(string.format('Harvested %s: %s', kind, shown), vim.log.levels.INFO, {
      id = 'harvest_path',
      title = 'Harvest Path',
    })
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

  local function git_toplevel()
    local code, lines = git_lines({ 'rev-parse', '--show-toplevel' })
    if code ~= 0 or not lines[1] or lines[1] == '' then
      return nil
    end

    return vim.fs.normalize(lines[1])
  end

  local function git_path(path)
    path = path:gsub('/+$', '')
    local root = git_toplevel()
    if not root then
      return path
    end

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

  -- Pickers keep a checkout only when it is a listed file buffer whose name
  -- exists on disk. The commit is part of the filename so a harvest buffer
  -- stays distinct from the working-tree file venture opens.
  local harvest_excluded = false

  local function ignore_harvest_dir()
    if harvest_excluded then
      return
    end

    local code, lines = git_lines({ 'rev-parse', '--git-path', 'info/exclude' })
    if code ~= 0 or not lines[1] or lines[1] == '' then
      return
    end

    local exclude = vim.fs.normalize(vim.fn.fnamemodify(lines[1], ':p'))
    local pattern = '/.harvest/'
    local body = {}
    if vim.uv.fs_stat(exclude) then
      body = vim.fn.readfile(exclude)
      for _, line in ipairs(body) do
        local trimmed = vim.trim(line)
        if trimmed == pattern or trimmed == '.harvest/' then
          harvest_excluded = true
          return
        end
      end
    else
      vim.fn.mkdir(vim.fs.dirname(exclude), 'p')
    end

    body[#body + 1] = pattern
    if vim.fn.writefile(body, exclude) == 0 then
      harvest_excluded = true
    end
  end

  local function safe_commit(commit)
    local safe = commit:gsub('[/\\:]+', '--')
    safe = safe:gsub('^%.+', '')
    if safe == '' or safe == '.' or safe == '..' then
      return 'commit'
    end
    return safe
  end

  local function checkout_file(commit, gitpath, listing)
    local root = git_toplevel() or vim.fs.normalize(vim.fn.getcwd())
    local base = vim.fs.normalize(vim.fs.joinpath(root, '.harvest'))
    local prefix = safe_commit(commit)
    local rel = (gitpath or ''):gsub('\\', '/'):gsub('^/+', ''):gsub('/+$', '')
    local dir, name
    if listing or rel == '' then
      dir = rel
      name = prefix .. ':.listing'
    else
      dir = vim.fs.dirname(rel)
      if dir == '.' then
        dir = ''
      end
      name = prefix .. ':' .. vim.fs.basename(rel)
    end

    local full = dir == '' and vim.fs.joinpath(base, name) or vim.fs.joinpath(base, dir, name)
    full = vim.fs.normalize(full)
    local parent = base .. '/'
    if full ~= base and full:sub(1, #parent) ~= parent then
      return vim.fs.normalize(vim.fs.joinpath(base, prefix .. ':.listing'))
    end
    return full
  end

  local function checkout_buffer(path)
    local want = vim.fs.normalize(path)
    for _, candidate in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_valid(candidate) then
        local bufname = vim.fs.normalize(vim.api.nvim_buf_get_name(candidate))
        if bufname == want then
          return candidate
        end
      end
    end
  end

  local function edit_checkout(path)
    local previous = vim.o.swapfile
    vim.o.swapfile = false
    local ok, err = pcall(vim.cmd, { cmd = 'edit', args = { path } })
    vim.o.swapfile = previous
    if not ok then
      vim.notify(tostring(err), vim.log.levels.ERROR, { title = 'Harvest' })
      return false
    end

    vim.bo.swapfile = false
    vim.bo.buflisted = true
    vim.bo.buftype = ''
    return true
  end

  -- Returns true when an already loaded checkout was refocused and its text
  -- was left in place. Returns nil when the checkout could not be opened.
  local function open_checkout(lines, path)
    if #lines == 0 then
      lines = { '' }
    end

    vim.fn.mkdir(vim.fs.dirname(path), 'p')
    ignore_harvest_dir()

    local existing = checkout_buffer(path)
    local loaded = existing
      and vim.api.nvim_buf_is_loaded(existing)
      and vim.uv.fs_stat(path) ~= nil
    if not loaded and vim.fn.writefile(lines, path) ~= 0 then
      vim.notify('Could not write ' .. path, vim.log.levels.ERROR, { title = 'Harvest' })
      return nil
    end

    if existing then
      if vim.api.nvim_get_current_buf() ~= existing then
        vim.bo[existing].buflisted = true
        vim.cmd.buffer(existing)
      end
      vim.bo.swapfile = false
      vim.bo.buflisted = true
      vim.bo.buftype = ''
      return loaded
    end

    if not edit_checkout(path) then
      return nil
    end
    return false
  end

  local function show_blob(path, start_line, end_line)
    local code, lines = git_lines({ 'show', last_commit .. ':' .. path })
    if code ~= 0 then
      notify_git(lines, 'git show')
      return
    end

    local reused = open_checkout(lines, checkout_file(last_commit, path, false))
    if reused == nil then
      return
    end
    vim.bo.filetype = vim.filetype.match({ filename = path }) or vim.bo.filetype
    notify_harvest(start_line and 'line' or 'filename', path)

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

    if open_checkout(lines, checkout_file(last_commit, path, true)) == nil then
      return
    end
    notify_harvest('directory', path)

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
