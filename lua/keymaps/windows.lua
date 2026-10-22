do
  local opposites = { h = 'l', l = 'h', k = 'j', j = 'k', }

  local function swap_window(direction)
    local source_win = vim.api.nvim_get_current_win()
    vim.cmd('wincmd ' .. direction)
    local target_win = vim.api.nvim_get_current_win()

    if source_win == target_win and opposites[direction] then
      while true do
        local current = vim.api.nvim_get_current_win()
        vim.cmd('wincmd ' .. opposites[direction])
        if vim.api.nvim_get_current_win() == current then
          break
        end
      end
      target_win = vim.api.nvim_get_current_win()
    end

    if source_win ~= target_win then
      local source_buf = vim.api.nvim_win_get_buf(source_win)
      local target_buf = vim.api.nvim_win_get_buf(target_win)

      vim.api.nvim_win_set_buf(source_win, target_buf)
      vim.api.nvim_win_set_buf(target_win, source_buf)
    end
  end


  -- <C-w>
  vim.keymap.set('n', '<C-w>H', function() swap_window('h') end, { desc = 'Swap window left' })
  vim.keymap.set('n', '<C-w>J', function() swap_window('j') end, { desc = 'Swap window down' })
  vim.keymap.set('n', '<C-w>K', function() swap_window('k') end, { desc = 'Swap window up' })
  vim.keymap.set('n', '<C-w>L', function() swap_window('l') end, { desc = 'Swap window right' })
end
