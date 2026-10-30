do
  -- <Esc>
  vim.keymap.set('n', '<Esc>', function() vim.cmd('nohlsearch') end, { desc = 'Not used, undo highlight search'} )

  -- <C-i>
  vim.keymap.set('n', '<C-i>', '<C-i>', { noremap = true })

  -- o
  vim.keymap.set('n', 'o', 'o<Esc>', { remap = false, desc = 'Begin a new line below the cursor and insert text as normal mode' })
  vim.keymap.set('n', 'O', 'O<Esc>', { remap = false, desc = 'Begin a new line above the cursor and insert text as normal mode' })
end
