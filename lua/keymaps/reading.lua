do
  local function hunk_diff(rev)
    local lines = vim.fn.systemlist({ 'git', 'diff', rev .. '...HEAD', '--' })
    if vim.v.shell_error ~= 0 then
      vim.notify(table.concat(lines, '\n'), vim.log.levels.ERROR, { title = 'git diff' })
      return
    end

    vim.cmd('enew')
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    vim.bo.filetype = 'diff'
    vim.api.nvim_win_set_cursor(0, { 1, 0 })
  end

  local function compare_diff(origin)
    Snacks.input({ prompt = 'Branch' }, function(branch)
      branch = vim.trim(branch or '')
      if branch == '' then
        return
      end

      local rev = origin and ('origin/' .. branch) or branch
      hunk_diff(rev)
    end)
  end

  -- <leader>h
  vim.keymap.set('n', '<leader>hs', function()
    hunk_diff('origin/staging')
  end, { desc = '[h]unk [s]taging diff origin' })
  vim.keymap.set('n', '<leader>hS', function()
    hunk_diff('staging')
  end, { desc = '[h]unk [s]taging diff local' })
  vim.keymap.set('n', '<leader>hc', function()
    compare_diff(true)
  end, { desc = '[h]unk [c]ompare diff origin' })
  vim.keymap.set('n', '<leader>hC', function()
    compare_diff(false)
  end, { desc = '[h]unk [c]ompare diff local' })
end
