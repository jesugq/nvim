do
  vim.keymap.set('n', '<leader>bm', ':NoNeckPain<CR>', { desc = 'Center buffer' })
  vim.keymap.set('n', '<leader>b9', ':NoNeckPainResize 90<CR>', { desc = 'Resize center buffer 90' })
  vim.keymap.set('n', '<leader>b0', ':NoNeckPainResize ', { desc = 'Resize center buffer specify' })
end
