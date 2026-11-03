do
  local context = require('libfuns.context')

  -- <leader>c
  vim.keymap.set('n', '<leader>cad', function() context.copy_directory('a') end, { desc = '[c]opy [a]bsolute [d]irectory' })
  vim.keymap.set('n', '<leader>caf', function() context.copy_filename('a') end, { desc = '[c]opy [a]bsolute [f]ilename' })
  vim.keymap.set('n', '<leader>cal', function() context.copy_line('a') end, { desc = '[c]opy [a]bsolute [l]ine' })
  vim.keymap.set('x', '<leader>cal', function() context.copy_visual_line('a') end, { desc = '[c]opy [a]bsolute [l]ines' })
  vim.keymap.set('n', '<leader>cdd', 'ggVGD', { desc = '[c]opy [d][d]' })
  vim.keymap.set('n', '<leader>cpd', function() context.copy_directory('p') end, { desc = '[c]opy [p]resent [d]irectory' })
  vim.keymap.set('n', '<leader>cpf', function() context.copy_filename('p') end, { desc = '[c]opy [p]resent [f]ilename' })
  vim.keymap.set('n', '<leader>cpl', function() context.copy_line('p') end, { desc = '[c]opy [p]resent [l]ine' })
  vim.keymap.set('x', '<leader>cpl', function() context.copy_visual_line('p') end, { desc = '[c]opy [p]resent [l]ines' })
  vim.keymap.set('n', '<leader>crd', function() context.copy_directory('r') end, { desc = '[c]opy [r]elative [d]irectory' })
  vim.keymap.set('n', '<leader>crf', function() context.copy_filename('r') end, { desc = '[c]opy [r]elative [f]ilename' })
  vim.keymap.set('n', '<leader>crl', function() context.copy_line('r') end, { desc = '[c]opy [r]elative [l]ine' })
  vim.keymap.set('x', '<leader>crl', function() context.copy_visual_line('r') end, { desc = '[c]opy [r]elative [l]ines' })
  vim.keymap.set('n', '<leader>cyy', 'ggVGY', { desc = '[c]opy [y][y]' })
end
