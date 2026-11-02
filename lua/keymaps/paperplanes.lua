do
  -- <leader>c
  vim.keymap.set('n', '<leader>cpp', function() vim.cmd('PP') end, { desc = '[c]opy [p]aper[p]lanes' })
  vim.keymap.set('x', '<leader>cpp', function() vim.cmd("'<,'>PP") end, { desc = '[c]opy [p]aper[p]lanes' })
end
