do
  vim.keymap.set('n', '<leader>bc', ':bd<CR>', { desc = 'Buffer close' })
  vim.keymap.set('n', '<leader>bC', ':%bd<CR>', { desc = 'Buffer close all' })
  vim.keymap.set('n', '<leader>br', ':checktime<CR>', { desc = 'Buffer refresh' })
  vim.keymap.set('n', '<leader>bw', function()
      local current_state = vim.wo.wrap
      vim.wo.wrap = not current_state
      vim.wo.linebreak = not current_state
  end, { desc = "Toggle word wrap" })
end
