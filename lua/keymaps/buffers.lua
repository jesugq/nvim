do
  local buffers = require('libfuns.buffers')

  -- <leader>b
  vim.keymap.set('n', '<leader>ba', function() buffers.add_buffer() end, { desc = 'Buffer add' })
  vim.keymap.set('n', '<leader>bb', '<C-^>', { desc = 'Buffer switch' })
  vim.keymap.set('n', '<leader>bc', function() Snacks.bufdelete() end, { desc = 'Buffer close' })
  vim.keymap.set('n', '<leader>bC', function() Snacks.bufdelete.all() end, { desc = 'Buffer close' })
  vim.keymap.set('n', '<leader>bd', function() buffers.delete_buffer() end, { desc = 'Buffer delete' })
  vim.keymap.set('n', '<leader>bn', function() buffers.rename_buffer() end, { desc = 'Buffer name' })
  vim.keymap.set('n', '<leader>bs', function() vim.cmd('w') end, { desc = 'Buffer save' })
  vim.keymap.set('n', '<leader>bS', function() vim.cmd('wa') end, { desc = 'Buffer save all' })
  vim.keymap.set('n', '<leader>bt', function() vim.cmd('checktime') end, { desc = 'Buffer time' })
  vim.keymap.set('n', '<leader>by', function() vim.cmd('recover') end, { desc = 'Buffer yield' })
  vim.keymap.set('n', '<leader>bk', function() buffers.wrap_buffer() end, { desc = 'Buffer knit' })
  vim.keymap.set('n', '<leader>bl', function() buffers.number_buffer() end, { desc = 'Buffer line' })
end
