do
  vim.keymap.set('n', '<leader>bm', ':NoNeckPain<CR>', { desc = 'Center buffer' })
  vim.keymap.set('n', '<leader>b9', ':NoNeckPainResize 90<CR>', { desc = 'Resize center buffer 90' })
  vim.keymap.set('n', '<leader>b0', ':NoNeckPainResize 100<CR>', { desc = 'Resize center buffer 100' })
  vim.keymap.set('n', '<leader>b-', ':NoNeckPainResize ', { desc = 'Resize center buffer specify' })
end
