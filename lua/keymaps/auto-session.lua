do
  local auto_session = require('libfuns.auto-session')

  -- <leader>q
  vim.keymap.set('n', '<leader>qa', function() auto_session.add_session() end, { desc = 'Session add' })
  vim.keymap.set('n', '<leader>qd', function() vim.cmd('AutoSession deletePicker') end, { desc = 'Session delete' })
  vim.keymap.set('n', '<leader>qf', function() vim.cmd('AutoSession search') end, { desc = 'Session find' })
  vim.keymap.set('n', '<leader>qq', function() vim.cmd('qa') end, { desc = 'Session quit' })
  vim.keymap.set('n', '<leader>qr', function() vim.cmd('restart!') end, { desc = 'Session restart!'})
  vim.keymap.set('n', '<leader>qR', function() vim.cmd('restart') end, { desc = 'Session restart'})
  vim.keymap.set('n', '<leader>qs', function() vim.cmd('AutoSession save') end, { desc = 'Session save' })
end
