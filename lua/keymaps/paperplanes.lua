do
  -- <leader>c
  vim.keymap.set('n', '<leader>cp', function() vim.cmd('PP') end, { desc = '[c]opy [p]aper[p]lanes' })
  vim.keymap.set('x', '<leader>cp', function() vim.cmd("'<,'>PP") end, { desc = '[c]opy [p]aper[p]lanes' })

  -- <leader>C
  vim.keymap.set('n', '<leader>Cp', function() vim.cmd('PP') end, { desc = '[c]opy [p]aper[p]lanes' })
  vim.keymap.set('x', '<leader>Cp', function() vim.cmd("'<,'>PP") end, { desc = '[c]opy [p]aper[p]lanes' })
end
