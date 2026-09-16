do
  vim.keymap.set('n', '<Esc>', function() vim.cmd('nohlsearch') end, { desc = 'Undo highlight search'} )
  vim.keymap.set('n', '<C-[>', function() vim.cmd('nohlsearch') end, { desc = 'Undo highlight search'} )

  vim.keymap.set('n', 'o', 'o<Esc>', { remap = false, desc = 'New line below normal mode' })
  vim.keymap.set('n', 'O', 'O<Esc>', { remap = false, desc = 'New line above normal mode' })

  vim.keymap.set('i', '<C-w>', '<Esc><C-w>')
  vim.keymap.set('i', '<C-c>', '<Esc><C-c>')
  vim.keymap.set('i', '<C-b>', '<Esc><C-b>')
end
