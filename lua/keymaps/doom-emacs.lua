do
  vim.keymap.set('n', '<leader>qq', ':qa<CR>', { desc = 'Quit all' })

  vim.keymap.set('n', '<leader>fs', ':w<CR>', { desc = 'Save file' })

  vim.keymap.set('n', '<leader>hrr', ':restart<CR>', { desc = 'Reload all'})
  vim.keymap.set('n', '<leader>hrt', ':source ~/.config/nvim/init.lua<CR>', { desc = 'Reload init'})
end
