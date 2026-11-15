do
  local windows = require('libfuns.windows')

  -- <C-w>
  vim.keymap.set('n', '<C-w><C-w>', function() windows.last_window() end, { desc = 'Switch to the previous window' })
  vim.keymap.set('n', '<C-w>H', function() windows.swap_window('h') end, { desc = 'Swap current with left' })
  vim.keymap.set('n', '<C-w>J', function() windows.swap_window('j') end, { desc = 'Swap current with down' })
  vim.keymap.set('n', '<C-w>K', function() windows.swap_window('k') end, { desc = 'Swap current with up' })
  vim.keymap.set('n', '<C-w>L', function() windows.swap_window('l') end, { desc = 'Swap current with right' })

  -- <leader>w
  vim.keymap.set('n', '<leader>ww', function() windows.window_switch() end, { desc = '[w]indow [w]indow' })
  vim.keymap.set('n', '<leader>wd', function() windows.window_delete() end, { desc = '[w]indow [d]elete' })
  vim.keymap.set('n', '<leader>ws', function() windows.window_save() end, { desc = '[w]indow [s]ave' })
  vim.keymap.set('n', '<leader>wt', function() windows.window_checktime() end, { desc = '[w]indow [t]ime' })
  vim.keymap.set('n', '<leader>wy', function() windows.window_recover() end, { desc = '[w]indow [y]ield' })
end
