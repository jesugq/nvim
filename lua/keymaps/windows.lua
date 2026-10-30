do
  local windows = require('libfuns.windows')

  -- <C-w>
  vim.keymap.set('n', '<C-w><C-w>', function() windows.last_window() end, { desc = 'Switch to the previous window' })
  vim.keymap.set('n', '<C-w>H', function() windows.swap_window('h') end, { desc = 'Swap current with left' })
  vim.keymap.set('n', '<C-w>J', function() windows.swap_window('j') end, { desc = 'Swap current with down' })
  vim.keymap.set('n', '<C-w>K', function() windows.swap_window('k') end, { desc = 'Swap current with up' })
  vim.keymap.set('n', '<C-w>L', function() windows.swap_window('l') end, { desc = 'Swap current with right' })
end
