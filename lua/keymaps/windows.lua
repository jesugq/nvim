do
  local windows = require('libfuns.windows')

  -- <C-w>
  vim.keymap.set('n', '<C-w><C-w>', function() windows.last_window() end, { desc = 'Window switch' })
  vim.keymap.set('n', '<C-w>H', function() windows.swap_window('h') end, { desc = 'Window swap left' })
  vim.keymap.set('n', '<C-w>J', function() windows.swap_window('j') end, { desc = 'Window swap down' })
  vim.keymap.set('n', '<C-w>K', function() windows.swap_window('k') end, { desc = 'Window swap up' })
  vim.keymap.set('n', '<C-w>L', function() windows.swap_window('l') end, { desc = 'Window swap right' })
end
