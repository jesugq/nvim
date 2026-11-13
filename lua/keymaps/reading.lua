do
  local last_commit

  local function git_lines(args)
    local cmd = { 'git' }
    vim.list_extend(cmd, args)
    local lines = vim.fn.systemlist(cmd)
    return vim.v.shell_error, lines
  end

  local function notify_git(lines, title)
    vim.notify(table.concat(lines, '\n'), vim.log.levels.ERROR, { title = title or 'git diff' })
  end

  local function show_diff(lines, commit)
    last_commit = commit
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
    show_diff(lines, commit)
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
    show_diff(lines, commit)
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

  local function hunk_view()
    if not last_commit then
      vim.notify('No commit from hunk compare', vim.log.levels.WARN, { title = 'git show' })
      return
    end

    local path = clipboard_path()
    if path == '' then
      vim.notify('Clipboard is empty', vim.log.levels.WARN, { title = 'git show' })
      return
    end

    local lines = vim.fn.systemlist({ 'git', 'show', last_commit .. ':' .. path })
    if vim.v.shell_error ~= 0 then
      vim.notify(table.concat(lines, '\n'), vim.log.levels.ERROR, { title = 'git show' })
      return
    end

    vim.cmd('enew')
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    pcall(vim.api.nvim_buf_set_name, 0, last_commit .. ':' .. path)
    vim.bo.filetype = vim.filetype.match({ filename = path }) or vim.bo.filetype
    vim.bo.modified = false
    vim.api.nvim_win_set_cursor(0, { 1, 0 })
  end

  -- <leader>h
  vim.keymap.set('n', '<leader>hc', function()
    ask_ref('Base', 'origin/', function(base)
      ask_ref('Commit', 'origin/', function(commit)
        hunk_diff(base, commit)
      end)
    end)
  end, { desc = '[h]unk [c]ompare origin' })
  vim.keymap.set('n', '<leader>hC', function()
    ask_ref('Base', '', function(base)
      ask_ref('Commit', '', function(commit)
        hunk_diff(base, commit)
      end)
    end)
  end, { desc = '[h]unk [C]ompare local' })
  vim.keymap.set('n', '<leader>hv', hunk_view, { desc = '[h]unk [v]iew' })
end
