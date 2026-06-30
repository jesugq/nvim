do
  vim.keymap.set('n', 'dm', '<Plug>(Marks-delete)', { desc = 'Delete a letter mark' })

  vim.keymap.set('n', 'm<leader>', '<Plug>(Marks-deletebuf)', { desc = 'Delete all marks in current buffer' })

  vim.keymap.set('n', ']m', '<Plug>(Marks-prev)', { desc = 'Go to prev mark in buffer' })
  vim.keymap.set('n', '[m', '<Plug>(Marks-next)', { desc = 'Go to next mark in buffer' })
end
