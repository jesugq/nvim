do
  -- <Esc>
  vim.keymap.set('n', '<C-[>', function() vim.cmd('nohlsearch') end, { desc = 'Undo highlight search'} )
  vim.keymap.set('n', '<Esc>', function() vim.cmd('nohlsearch') end, { desc = 'Undo highlight search'} )

  -- <C-?>
  vim.keymap.set('i', '<C-b>', '<Esc>', { remap = true })
  vim.keymap.set('i', '<C-c>', '<Esc>', { remap = true })
  vim.keymap.set('i', '<C-w>', '<Esc>', { remap = true })

  -- ?
  vim.keymap.set('n', 'o', 'o<Esc>', { remap = false, desc = 'New line below normal mode' })
  vim.keymap.set('n', 'O', 'O<Esc>', { remap = false, desc = 'New line above normal mode' })
end
