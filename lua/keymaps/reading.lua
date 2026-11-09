do
  local last_commit

  local function hunk_diff(base, commit)
    local lines = vim.fn.systemlist({ 'git', 'diff', base .. '...' .. commit, '--' })
    if vim.v.shell_error ~= 0 then
      vim.notify(table.concat(lines, '\n'), vim.log.levels.ERROR, { title = 'git diff' })
      return
    end

    last_commit = commit

    vim.cmd('enew')
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    vim.bo.filetype = 'diff'
    vim.api.nvim_win_set_cursor(0, { 1, 0 })
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
  end, { desc = '[h]unk [c]ompare local' })
  vim.keymap.set('n', '<leader>hv', hunk_view, { desc = '[h]unk [v]iew' })
end
