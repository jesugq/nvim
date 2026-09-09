do
  vim.keymap.set('n', '<C-w>m', function() vim.cmd('ZenMode') end, { desc = 'Window zen mode' })
end
