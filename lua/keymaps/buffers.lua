do
  local buffers = require('libfuns.buffers')

  -- <leader>b
  vim.keymap.set('n', '<leader>bb', '<C-^>', { desc = '[b]uffer [b]uffer' })
  vim.keymap.set('n', '<leader>bs', function() vim.cmd('w') end, { desc = '[b]uffer [s]ave' })
  vim.keymap.set('n', '<leader>bt', function() vim.cmd('checktime') end, { desc = '[b]uffer [t]ime' })
  vim.keymap.set('n', '<leader>bR', function() buffers.buffer_random(vim.fn.expand('%:.:h')) end, { desc = '[b]uffer [v]iew' })
  vim.keymap.set('n', '<leader>by', function() vim.cmd('recover') end, { desc = '[b]uffer [y]ield' })
end
