do
  local buffers = require('libfuns.buffers')

  -- <leader>b
  vim.keymap.set('n', '<leader>ba', function() buffers.add_buffer() end, { desc = '[b]uffer [a]dd' })
  vim.keymap.set('n', '<leader>bb', '<C-^>', { desc = '[b]uffer [b]uffer' })
  vim.keymap.set('n', '<leader>bc', function() Snacks.bufdelete() end, { desc = '[b]uffer [c]lose' })
  vim.keymap.set('n', '<leader>bC', function() Snacks.bufdelete.all() end, { desc = '[b]uffer [c]lose' })
  vim.keymap.set('n', '<leader>bd', function() buffers.delete_buffer() end, { desc = '[b]uffer [d]elete' })
  vim.keymap.set('n', '<leader>bk', function() buffers.wrap_buffer() end, { desc = '[b]uffer [k]nit' })
  vim.keymap.set('n', '<leader>bl', function() buffers.number_buffer() end, { desc = '[b]uffer [l]ine' })
  vim.keymap.set('n', '<leader>bn', function() buffers.rename_buffer() end, { desc = '[b]uffer [n]ame' })
  vim.keymap.set('n', '<leader>bs', function() vim.cmd('w') end, { desc = '[b]uffer [s]ave' })
  vim.keymap.set('n', '<leader>bS', function() vim.cmd('wa') end, { desc = '[b]uffer [s]ave all' })
  vim.keymap.set('n', '<leader>bt', function() vim.cmd('checktime') end, { desc = '[b]uffer [t]ime' })
  vim.keymap.set('n', '<leader>by', function() vim.cmd('recover') end, { desc = '[b]uffer [y]ield' })
end
