do
  local context = require('libfuns.context')

  -- <leader>c
  vim.keymap.set('n', '<leader>cd', 'ggVGD', { desc = 'Copy dd' })
  vim.keymap.set('n', '<leader>cy', 'ggVGY', { desc = 'Copy yy' })

  context.map_contexts()
end
