do
  local auto_session = require('libfuns.auto-session')

  -- <leader>q
  vim.keymap.set('n', '<leader>qa', function() auto_session.add_session() end, { desc = '[q]uest [a]dd' })
  vim.keymap.set('n', '<leader>qd', function() vim.cmd('AutoSession deletePicker') end, { desc = '[q]uest [d]elete' })
  vim.keymap.set('n', '<leader>qf', function() vim.cmd('AutoSession search') end, { desc = '[q]uest [f]ind' })
  vim.keymap.set('n', '<leader>qq', function() vim.cmd('qa') end, { desc = '[q]uest [q]uit' })
  vim.keymap.set('n', '<leader>qr', function() vim.cmd('restart!') end, { desc = '[q]uest [r]eload hard'})
  vim.keymap.set('n', '<leader>qR', function() vim.cmd('restart') end, { desc = '[q]uest [r]eload soft'})
  vim.keymap.set('n', '<leader>qs', function() vim.cmd('AutoSession save') end, { desc = '[q]uest [s]ave' })
end
