do
  local context = require('libfuns.context')

  -- <leader>c
  vim.keymap.set('n', '<leader>cd', function() context.copy_directory('r') end, { desc = '[c]opy [d]irectory' })
  vim.keymap.set('n', '<leader>cf', function() context.copy_filename('r') end, { desc = '[c]opy [f]ilename' })
  vim.keymap.set('n', '<leader>cl', function() context.copy_line('r') end, { desc = '[c]opy [l]ine' })
  vim.keymap.set('x', '<leader>cl', function() context.copy_visual_line('r') end, { desc = '[c]opy [l]ines' })
  vim.keymap.set('n', '<leader>cD', 'ggVGD', { desc = '[c]opy [D]' })
  vim.keymap.set('n', '<leader>cY', 'ggVGY', { desc = '[c]opy [Y]' })

  -- <leader>C
  vim.keymap.set('n', '<leader>Cd', function() context.copy_directory('a') end, { desc = '[c]opy [d]irectory' })
  vim.keymap.set('n', '<leader>Cf', function() context.copy_filename('a') end, { desc = '[c]opy [f]ilename' })
  vim.keymap.set('n', '<leader>Cl', function() context.copy_line('a') end, { desc = '[c]opy [l]ine' })
  vim.keymap.set('x', '<leader>Cl', function() context.copy_visual_line('a') end, { desc = '[c]opy [l]ines' })
  vim.keymap.set('n', '<leader>CD', 'ggVGD', { desc = '[c]opy [D]' })
  vim.keymap.set('n', '<leader>CY', 'ggVGY', { desc = '[c]opy [Y]' })
end
