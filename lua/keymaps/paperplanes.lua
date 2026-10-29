do
  -- <leader>c
  vim.keymap.set('n', '<leader>cp', function() vim.cmd('PP') end, { desc = 'Paperplanes buffer' })
  vim.keymap.set('x', '<leader>cp', function() vim.cmd("'<,'>PP") end, { desc = 'Paperplanes selection' })
end
