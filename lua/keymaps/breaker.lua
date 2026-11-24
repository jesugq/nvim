do
  -- <Esc> OVERRIDE
  vim.keymap.set('n', '<Esc>', function() vim.cmd('nohlsearch') end, { desc = 'Not used, undo highlight search'} )

  -- <C-i> OVERRIDE
  vim.keymap.set('n', '<C-i>', '<C-i>', { noremap = true })
end
