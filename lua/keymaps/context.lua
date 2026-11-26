do
  local context = require('libfuns.context')

  -- <leader>c
  vim.keymap.set('n', '<leader>cd', function() context.copy_directory('r') end, { desc = '[c]ontext [d]irectory' })
  vim.keymap.set('n', '<leader>cf', function() context.copy_filename('r') end, { desc = '[c]ontext [f]ilename' })
  vim.keymap.set('n', '<leader>ct', function() context.copy_filename('p') end, { desc = '[c]ontext [t]his' })
  vim.keymap.set('n', '<leader>cl', function() context.copy_line('r') end, { desc = '[c]ontext [l]ine' })
  vim.keymap.set('x', '<leader>cl', function() context.copy_visual_line('r') end, { desc = '[c]ontext [l]ines' })
  vim.keymap.set('n', '<leader>cD', 'ggVGD', { desc = '[c]ontext [D]elete' })
  vim.keymap.set('n', '<leader>cY', 'ggVGY', { desc = '[c]ontext [Y]ank' })

  -- <leader>C
  vim.keymap.set('n', '<leader>Cd', function() context.copy_directory('a') end, { desc = '[C]ontext [d]irectory' })
  vim.keymap.set('n', '<leader>Cf', function() context.copy_filename('a') end, { desc = '[C]ontext [f]ilename' })
  vim.keymap.set('n', '<leader>Ct', function() context.copy_filename('e') end, { desc = '[C]ontext [T]his' })
  vim.keymap.set('n', '<leader>Cl', function() context.copy_line('a') end, { desc = '[C]ontext [l]ine' })
  vim.keymap.set('x', '<leader>Cl', function() context.copy_visual_line('a') end, { desc = '[C]ontext [l]ines' })
  vim.keymap.set('n', '<leader>CD', 'ggVGD', { desc = '[C]ontext [D]elete' })
  vim.keymap.set('n', '<leader>CY', 'ggVGY', { desc = '[C]ontext [Y]ank' })
end
