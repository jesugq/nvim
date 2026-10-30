do
  -- <leader>c
  vim.keymap.set('n', '<leader>cp', function() vim.cmd('PP') end, { desc = '[c]opy [p]aperplanes' })
  vim.keymap.set('x', '<leader>cp', function() vim.cmd("'<,'>PP") end, { desc = '[c]opy [p]aperplanes' })
end
