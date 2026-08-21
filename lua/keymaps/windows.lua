do
  local function swap_window(direction)
    local source_win = vim.api.nvim_get_current_win()
    vim.cmd('wincmd ' .. direction)
    local target_win = vim.api.nvim_get_current_win()

    if source_win ~= target_win then
      local source_buf = vim.api.nvim_win_get_buf(source_win)
      local target_buf = vim.api.nvim_win_get_buf(target_win)

      vim.api.nvim_win_set_buf(source_win, target_buf)
      vim.api.nvim_win_set_buf(target_win, source_buf)
    end
  end

  vim.keymap.set('n', '<C-w>c', '<Nop>', { desc = 'Close current window' })
  vim.keymap.set('n', '<C-w>x', '<C-w>c', { remap = false, desc = 'Close current window' })

  vim.keymap.set('n', '<C-w>H', '<Nop>', { desc = 'Move window left' })
  vim.keymap.set('n', '<C-w>J', '<Nop>', { desc = 'Move window down' })
  vim.keymap.set('n', '<C-w>K', '<Nop>', { desc = 'Move window up' })
  vim.keymap.set('n', '<C-w>L', '<Nop>', { desc = 'Move window right' })
  vim.keymap.set('n', '<C-w>h', function() swap_window('h') end, { desc = 'Swap window left' })
  vim.keymap.set('n', '<C-w>j', function() swap_window('j') end, { desc = 'Swap window down' })
  vim.keymap.set('n', '<C-w>k', function() swap_window('k') end, { desc = 'Swap window up' })
  vim.keymap.set('n', '<C-w>l', function() swap_window('l') end, { desc = 'Swap window right' })
end
