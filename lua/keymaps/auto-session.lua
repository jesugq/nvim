do
  vim.keymap.set('n', '<leader>qq', function() vim.cmd('qa') end, { desc = 'Quit all' })
  vim.keymap.set('n', '<leader>qr', function() vim.cmd('restart!') end, { desc = 'Quit restart'})

  vim.keymap.set('n', '<leader>qw', function() vim.cmd('AutoSession toggle') end, { desc = 'Session save toggle' })
  vim.keymap.set('n', '<leader>qs', function() vim.cmd('AutoSession save') end, { desc = 'Session save' })
  vim.keymap.set('n', '<leader>qc', ':AutoSession save ', { desc = 'Session create' })
  vim.keymap.set('n', '<leader>qf', function() vim.cmd('AutoSession search') end, { desc = 'Session find from' })
  vim.keymap.set('n', '<leader>qd', function() vim.cmd('AutoSession deletePicker') end, { desc = 'Session delete from' })
end
