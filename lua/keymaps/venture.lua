do
  local venture = require('libfuns.venture')

  -- <leader>v
  vim.keymap.set('n', '<leader>vd', function() venture.view_directory() end, { desc = '[v]enture [d]irectory' })
  vim.keymap.set('n', '<leader>vf', function() venture.view_filename() end, { desc = '[v]enture [f]ilename' })
  vim.keymap.set('n', '<leader>vl', function() venture.view_line() end, { desc = '[v]enture [l]ine' })
  vim.keymap.set('n', '<leader>vD', function() venture.view_dd() end, { desc = '[v]enture [D]elete' })
  vim.keymap.set('n', '<leader>vY', function() venture.view_yy() end, { desc = '[v]enture [Y]ank' })

  -- <leader>V
  vim.keymap.set('n', '<leader>Vd', function() venture.view_directory() end, { desc = '[V]enture [d]irectory' })
  vim.keymap.set('n', '<leader>Vf', function() venture.view_filename() end, { desc = '[V]enture [f]ilename' })
  vim.keymap.set('n', '<leader>Vl', function() venture.view_line() end, { desc = '[V]enture [l]ine' })
  vim.keymap.set('n', '<leader>VD', function() venture.view_dd() end, { desc = '[V]enture [D]elete' })
  vim.keymap.set('n', '<leader>VY', function() venture.view_yy() end, { desc = '[V]enture [Y]ank' })
end
