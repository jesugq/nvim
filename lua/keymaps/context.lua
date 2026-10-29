do
  local context = require('libfuns.context')

  -- <leader>c
  vim.keymap.set('n', '<leader>cd', 'ggVGD', { desc = 'Copy dd' })
  vim.keymap.set('n', '<leader>cy', 'ggVGY', { desc = 'Copy yy' })

  vim.keymap.set('n', '<leader>cad', function() context.copy_directory('a') end, { desc = 'Copy absolute directory' })
  vim.keymap.set('n', '<leader>caD', function() context.copy_directory('a', true) end, { desc = 'Copy absolute directory url' })
  vim.keymap.set('n', '<leader>caf', function() context.copy_filename('a') end, { desc = 'Copy absolute filename' })
  vim.keymap.set('n', '<leader>caF', function() context.copy_filename('a', true) end, { desc = 'Copy absolute filename url' })
  vim.keymap.set('n', '<leader>can', function() context.copy_filename_without_extension('a') end, { desc = 'Copy absolute filename without extension' })
  vim.keymap.set('n', '<leader>caN', function() context.copy_filename_without_extension('a', true) end, { desc = 'Copy absolute filename without extension url' })
  vim.keymap.set('n', '<leader>cal', function() context.copy_line('a') end, { desc = 'Copy absolute line' })
  vim.keymap.set('x', '<leader>cal', function() context.copy_visual_line('a') end, { desc = 'Copy absolute lines' })

  vim.keymap.set('n', '<leader>crd', function() context.copy_directory('r') end, { desc = 'Copy relative directory' })
  vim.keymap.set('n', '<leader>crD', function() context.copy_directory('r', true) end, { desc = 'Copy relative directory url' })
  vim.keymap.set('n', '<leader>crf', function() context.copy_filename('r') end, { desc = 'Copy relative filename' })
  vim.keymap.set('n', '<leader>crF', function() context.copy_filename('r', true) end, { desc = 'Copy relative filename url' })
  vim.keymap.set('n', '<leader>crn', function() context.copy_filename_without_extension('r') end, { desc = 'Copy relative filename without extension' })
  vim.keymap.set('n', '<leader>crN', function() context.copy_filename_without_extension('r', true) end, { desc = 'Copy relative filename without extension url' })
  vim.keymap.set('n', '<leader>crl', function() context.copy_line('r') end, { desc = 'Copy relative line' })
  vim.keymap.set('x', '<leader>crl', function() context.copy_visual_line('r') end, { desc = 'Copy relative lines' })

  vim.keymap.set('n', '<leader>cfd', function() context.copy_directory('f') end, { desc = 'Copy file directory' })
  vim.keymap.set('n', '<leader>cfD', function() context.copy_directory('f', true) end, { desc = 'Copy file directory url' })
  vim.keymap.set('n', '<leader>cff', function() context.copy_filename('f') end, { desc = 'Copy file filename' })
  vim.keymap.set('n', '<leader>cfF', function() context.copy_filename('f', true) end, { desc = 'Copy file filename url' })
  vim.keymap.set('n', '<leader>cfn', function() context.copy_filename_without_extension('f') end, { desc = 'Copy file filename without extension' })
  vim.keymap.set('n', '<leader>cfN', function() context.copy_filename_without_extension('f', true) end, { desc = 'Copy file filename without extension url' })
  vim.keymap.set('n', '<leader>cfl', function() context.copy_line('f') end, { desc = 'Copy file line' })
  vim.keymap.set('x', '<leader>cfl', function() context.copy_visual_line('f') end, { desc = 'Copy file lines' })
end
