do
  local nookers = require('libfuns.nookers')

  vim.keymap.set('n', '<leader>nC', '<cmd>%bdelete<cr>', { desc = '[n]ook [C]lose all' })
  vim.keymap.set('n', '<leader>nS', function() vim.cmd('wa') end, { desc = '[n]ook [S]ave all' })
  vim.keymap.set('n', '<leader>nW', function() nookers.wrap_nook() end, { desc = '[n]ook [W]rap' })
  vim.keymap.set('n', '<leader>nN', function() nookers.number_nook() end, { desc = '[n]ook [N]umber' })
end
