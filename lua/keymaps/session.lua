do
  vim.keymap.set('n', '<leader>qq', ':qa<CR>', { desc = 'Quit all' })
  vim.keymap.set('n', '<leader>qr', ':restart<CR>', { desc = 'Quit restart'})

  vim.keymap.set('n', '<leader>fs', ':w<CR>', { desc = 'File save' })
  vim.keymap.set('n', '<leader>fS', ':wa<CR>', { desc = 'File save all' })
end
