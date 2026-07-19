do
  vim.keymap.set('n', '<leader>qq', ':qa<CR>', { desc = 'Quit all' })
  vim.keymap.set('n', '<leader>qr', ':restart<CR>', { desc = 'Quit restart'})

  vim.keymap.set('n', '<leader>fs', ':w<CR>', { desc = 'File save' })
  vim.keymap.set('n', '<leader>fS', ':wa<CR>', { desc = 'File save all' })

  vim.keymap.set('n', '<leader>bx', ':bd<CR>', { desc = 'Buffer close' })
  vim.keymap.set('n', '<leader>bX', ':%bd<CR>', { desc = 'Buffer close all' })
  vim.keymap.set('n', '<leader>br', ':checktime<CR>', { desc = 'Buffer refresh' })
  vim.keymap.set('n', '<leader>bw', function()
      local current_state = vim.wo.wrap
      vim.wo.wrap = not current_state
      vim.wo.linebreak = not current_state
  end, { desc = "Toggle word wrap" })
end
