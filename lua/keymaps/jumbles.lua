do
  local jumbles = require('libfuns.jumbles')

  -- <leader>j
  vim.keymap.set('n', '<leader>jC', '<cmd>%bdelete<cr>', { desc = '[j]umble [C]lose all' })
  vim.keymap.set('n', '<leader>jS', function() vim.cmd('wa') end, { desc = '[j]umble [S]ave all' })
  vim.keymap.set('n', '<leader>jW', function() jumbles.wrap_jumble() end, { desc = '[j]umble [W]rap' })
  vim.keymap.set('n', '<leader>jN', function() jumbles.number_jumble() end, { desc = '[j]umble [N]umber' })
end
