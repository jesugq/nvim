do
  local function copy_notify_path(message)
    vim.notify(message, vim.log.levels.INFO, { id = 'copy_path', title = 'copy Path', })
  end

  local function copy_absolute()
    local info = vim.fn.expand('%:p')

    vim.fn.setreg('+', info)
    vim.fn.setreg('"', info)

    copy_notify_path('Copied absolute: ' .. info)
  end

  local function copy_absolute_url()
    local info = vim.uri_encode(vim.fn.expand('%:p'))

    vim.fn.setreg('+', info)
    vim.fn.setreg('"', info)

    copy_notify_path('Copied absolute url: ' .. info)
  end

  local function copy_file()
    local info = vim.fn.expand('%:t')

    vim.fn.setreg('+', info)
    vim.fn.setreg('"', info)

    copy_notify_path('Copied file: ' .. info)
  end

  local function copy_line()
    local path = vim.fn.expand('%:.')
    local line = vim.api.nvim_win_get_cursor(0)[1]

    local info = string.format('%s:%d', path, line)

    vim.fn.setreg('+', info)
    vim.fn.setreg('"', info)

    copy_notify_path('Copied line: ' .. info)
  end

  local function copy_lixe()
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

    copy_notify_path('Copied lixe: ' .. path)
  end

  local function copy_relative()
    local info = vim.fn.expand('%:.')

    vim.fn.setreg('+', info)
    vim.fn.setreg('"', info)

    copy_notify_path('Copied relative: ' .. info)
  end

  local function copy_relative_url()
    local info = vim.uri_encode(vim.fn.expand('%:.'))

    vim.fn.setreg('+', info)
    vim.fn.setreg('"', info)

    copy_notify_path('Copied relative url: ' .. info)
  end

  local function copy_working()
    local info = vim.fn.getcwd()

    vim.fn.setreg('+', info)
    vim.fn.setreg('"', info)

    copy_notify_path('Copied working: ' .. info)
  end

  -- <leader>c
  vim.keymap.set('n', '<leader>ca', copy_absolute, { desc = 'Copy absolute' })
  vim.keymap.set('n', '<leader>cA', copy_absolute_url, { desc = 'Copy absolute url' })
  vim.keymap.set('n', '<leader>cd', 'ggVGD', { desc = 'Copy dd' })
  vim.keymap.set('n', '<leader>cf', copy_file, { desc = 'Copy file' })
  vim.keymap.set('n', '<leader>cl', copy_line, { desc = 'Copy line' })
  vim.keymap.set('x', '<leader>cl', copy_lixe, { desc = 'Copy lixe' })
  vim.keymap.set('n', '<leader>cr', copy_relative, { desc = 'Copy relative' })
  vim.keymap.set('n', '<leader>cR', copy_relative_url, { desc = 'Copy relative url' })
  vim.keymap.set('n', '<leader>cw', copy_working, { desc = 'Copy working' })
  vim.keymap.set('n', '<leader>cy', 'ggVGY', { desc = 'Copy yy' })
end
