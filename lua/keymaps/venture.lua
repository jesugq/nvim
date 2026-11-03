do
  local venture = require('libfuns.venture')

  -- <leader>v
  vim.keymap.set('n', '<leader>vad', function() venture.view_directory('a') end, { desc = '[v]iew [a]bsolute [d]irectory' })
  vim.keymap.set('n', '<leader>vaf', function() venture.view_filename('a') end, { desc = '[v]iew [a]bsolute [f]ilename' })
  vim.keymap.set('n', '<leader>val', function() venture.view_line('a') end, { desc = '[v]iew [a]bsolute [l]ine' })
  vim.keymap.set('n', '<leader>vdd', function() venture.view_dd() end, { desc = '[v]iew [d][d]' })
  vim.keymap.set('n', '<leader>vpd', function() venture.view_directory('p') end, { desc = '[v]iew [p]resent [d]irectory' })
  vim.keymap.set('n', '<leader>vpf', function() venture.view_filename('p') end, { desc = '[v]iew [p]resent [f]ilename' })
  vim.keymap.set('n', '<leader>vpl', function() venture.view_line('p') end, { desc = '[v]iew [p]resent [l]ine' })
  vim.keymap.set('n', '<leader>vrd', function() venture.view_directory('r') end, { desc = '[v]iew [r]elative [d]irectory' })
  vim.keymap.set('n', '<leader>vrf', function() venture.view_filename('r') end, { desc = '[v]iew [r]elative [f]ilename' })
  vim.keymap.set('n', '<leader>vrl', function() venture.view_line('r') end, { desc = '[v]iew [r]elative [l]ine' })
  vim.keymap.set('n', '<leader>vyy', function() venture.view_yy() end, { desc = '[v]iew [y][y]' })
end
