do
  local function yank_relative_file()
    local info = vim.fn.expand('%:.')

    vim.fn.setreg('+', info)
    vim.fn.setreg('"', info)

    vim.notify('Yanked relative file: ' .. info, vim.log.levels.INFO)
  end

  local function yank_relative_file_line_n()
    local path = vim.fn.expand('%:.')
    local line = vim.api.nvim_win_get_cursor(0)[1]

    local info = string.format('%s:%d', path, line)

    vim.fn.setreg('+', info)
    vim.fn.setreg('"', info)

    vim.notify('Yanked relative file line: ' .. info, vim.log.levels.INFO)
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

    vim.notify('Yanked relative file line: ' .. path, vim.log.levels.INFO)
  end

  local function yank_relative_buffer_paths()
    local bufs = {}
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buftype == '' then
        local full_path = vim.api.nvim_buf_get_name(buf)
        if full_path ~= '' then
          local rel_path = vim.fn.fnamemodify(full_path, ':.')
          table.insert(bufs, rel_path)
        end
      end
    end

    local info = table.concat(bufs, '\n')

    vim.fn.setreg('+', info)
    vim.fn.setreg('"', info)

    vim.notify('Yanked relative buffer paths:\n' .. info, vim.log.levels.INFO)
  end

  local function yank_relative_window_paths()
    local bufs = {}
    local seen = {}

    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
      local buf = vim.api.nvim_win_get_buf(win)

      if not seen[buf] then
        seen[buf] = true
        if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buftype == '' then
          local full_path = vim.api.nvim_buf_get_name(buf)
          if full_path ~= '' then
            local rel_path = vim.fn.fnamemodify(full_path, ':.')
            table.insert(bufs, rel_path)
          end
        end
      end
    end

    local info = table.concat(bufs, '\n')

    vim.fn.setreg('+', info)
    vim.fn.setreg('"', info)

    vim.notify('Yanked relative window paths:\n' .. info, vim.log.levels.INFO)
  end

  vim.keymap.set('n', '<leader>yf', yank_relative_file, { desc = 'Yank relative file' })
  vim.keymap.set('n', '<leader>yg', yank_relative_file_line_n, { desc = 'Yank relative file line' })
  vim.keymap.set('x', '<leader>yg', yank_relative_file_line_x, { desc = 'Yank relative file line' })
  vim.keymap.set('n', '<leader>yb', yank_relative_buffer_paths, { desc = 'Yank relative buffer paths' })
  vim.keymap.set('n', '<leader>yw', yank_relative_window_paths, { desc = 'Yank relative window paths' })
end
