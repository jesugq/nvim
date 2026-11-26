do
  local auto_session = require('libfuns.auto-session')

  -- <leader>q
  vim.keymap.set('n', '<leader>qa', function() auto_session.add_session() end, { desc = '[q]uarry [a]dd' })
  vim.keymap.set('n', '<leader>qd', function() vim.cmd('AutoSession deletePicker') end, { desc = '[q]uarry [d]elete' })
  vim.keymap.set('n', '<leader>qf', function() vim.cmd('AutoSession search') end, { desc = '[q]uarry [f]ind' })
  vim.keymap.set('n', '<leader>qp', function()
    vim.pack.del(vim.iter(vim.pack.get()):filter(function(p) return not p.active end):map(function(p) return p.spec.name end):totable())
  end, { desc = '[q]uarry [p]ackages' })
  vim.keymap.set('n', '<leader>qq', function() vim.cmd('qa') end, { desc = '[q]uarry [q]uit' })
  vim.keymap.set('n', '<leader>qr', function() vim.cmd('restart!') end, { desc = '[q]uarry [r]eload hard'})
  vim.keymap.set('n', '<leader>qR', function() vim.cmd('restart') end, { desc = '[q]uarry [R]eload soft'})
  vim.keymap.set('n', '<leader>qs', function() vim.cmd('AutoSession save') end, { desc = '[q]uarry [s]ave' })
end
