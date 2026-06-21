do
  vim.keymap.set('n', '<leader>qq', ':qa<CR>', { desc = 'Quit all' })
  vim.keymap.set('n', '<leader>qr', ':restart<CR>', { desc = 'Reload all'})

  vim.keymap.set('n', '<leader>fs', ':w<CR>', { desc = 'Save file' })
end
