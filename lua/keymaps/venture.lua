do
  local venture = require('libfuns.venture')

  -- <leader>v
  vim.keymap.set('n', '<leader>vd', function() venture.view_directory() end, { desc = '[v]iew [d]irectory' })
  vim.keymap.set('n', '<leader>vf', function() venture.view_filename() end, { desc = '[v]iew [f]ilename' })
  vim.keymap.set('n', '<leader>vl', function() venture.view_line() end, { desc = '[v]iew [l]ine' })
  vim.keymap.set('n', '<leader>vD', function() venture.view_dd() end, { desc = '[v]iew [D]' })
  vim.keymap.set('n', '<leader>vY', function() venture.view_yy() end, { desc = '[v]iew [Y]' })

  -- <leader>V
  vim.keymap.set('n', '<leader>Vd', function() venture.view_directory() end, { desc = '[v]iew [d]irectory' })
  vim.keymap.set('n', '<leader>Vf', function() venture.view_filename() end, { desc = '[v]iew [f]ilename' })
  vim.keymap.set('n', '<leader>Vl', function() venture.view_line() end, { desc = '[v]iew [l]ine' })
  vim.keymap.set('n', '<leader>VD', function() venture.view_dd() end, { desc = '[v]iew [D]' })
  vim.keymap.set('n', '<leader>VY', function() venture.view_yy() end, { desc = '[v]iew [Y]' })
end
