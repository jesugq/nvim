do
  -- <Esc>
  vim.keymap.set('n', '<C-[>', function() vim.cmd('nohlsearch') end, { desc = 'Undo highlight search'} )
  vim.keymap.set('n', '<Esc>', function() vim.cmd('nohlsearch') end, { desc = 'Undo highlight search'} )

  -- <C-?>
  vim.keymap.set('n', '<C-b>', '<Nop>')
  vim.keymap.set('n', '<C-c>', '<Nop>')
  vim.keymap.set('n', '<C-w>', '<Nop>')

  -- ?
  vim.keymap.set('n', 'o', 'o<Esc>', { remap = false, desc = 'New line below normal mode' })
  vim.keymap.set('n', 'O', 'O<Esc>', { remap = false, desc = 'New line above normal mode' })
end
