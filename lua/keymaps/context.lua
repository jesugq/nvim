do
  local function notify_yank(message)
    vim.notify(message, vim.log.levels.INFO, { id = 'yanked-context' })
  end

  local function yank_working_path()
    local info = vim.fn.getcwd()

    vim.fn.setreg('+', info)
    vim.fn.setreg('"', info)

    notify_yank('Yanked working path: ' .. info)
  end

  local function yank_relative_file()
    local info = vim.fn.expand('%:.')

    vim.fn.setreg('+', info)
    vim.fn.setreg('"', info)

    notify_yank('Yanked relative file: ' .. info)
  end

  local function yank_encoded_file()
    local info = vim.uri_encode(vim.fn.expand('%:.'))

    vim.fn.setreg('+', info)
    vim.fn.setreg('"', info)

    notify_yank('Yanked encoded file: ' .. info)
  end

  local function yank_relative_file_line_n()
    local path = vim.fn.expand('%:.')
    local line = vim.api.nvim_win_get_cursor(0)[1]

    local info = string.format('%s:%d', path, line)

    vim.fn.setreg('+', info)
    vim.fn.setreg('"', info)

    notify_yank('Yanked relative file line: ' .. info)
  end

  local function yank_relative_file_line_x()
    local path = vim.fn.expand('%:.')

    local start_line = vim.fn.line('v')
    local end_line = vim.fn.line('.')

    if start_line > end_line then
      start_line, end_line = end_line, start_line
    end

    local info = (start_line == end_line)
      and string.format('%s:%d', path, start_line)
      or string.format('%s:%d-%d', path, start_line, end_line)

    vim.fn.setreg('+', info)
    vim.fn.setreg('"', info)

    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), 'n', true)

    notify_yank('Yanked relative file line: ' .. path)
  end

  -- <leader>y
  vim.keymap.set('n', '<leader>ye', yank_encoded_file, { desc = 'Yank encoded file' })
  vim.keymap.set('n', '<leader>yf', yank_relative_file, { desc = 'Yank relative file' })
  vim.keymap.set('n', '<leader>yl', yank_relative_file_line_n, { desc = 'Yank relative file line' })
  vim.keymap.set('x', '<leader>yl', yank_relative_file_line_x, { desc = 'Yank relative file line' })
  vim.keymap.set('n', '<leader>yw', yank_working_path, { desc = 'Yank working path' })
end
