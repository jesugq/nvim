do
  local harvest = require('libfuns.harvest')

  -- <leader>h
  vim.keymap.set('n', '<leader>ha', function() harvest.hunk_assign('') end, { desc = '[h]unk [a]ssign' })
  vim.keymap.set('n', '<leader>hc', function() harvest.hunk_compare('') end, { desc = '[h]unk [C]ompare local' })
  vim.keymap.set('n', '<leader>hC', function() harvest.hunk_compare('origin/') end, { desc = '[h]unk [c]ompare origin' })
  vim.keymap.set('n', '<leader>hd', function() harvest.hunk_dd() end, { desc = '[h]unk [d]elete' })
  vim.keymap.set('n', '<leader>hf', function() harvest.hunk_filename() end, { desc = '[h]unk [f]ilename' })
  vim.keymap.set('n', '<leader>hl', function() harvest.hunk_line() end, { desc = '[h]unk [l]ine' })
  vim.keymap.set('n', '<leader>hD', function() harvest.hunk_dd() end, { desc = '[h]unk [D]elete' })
  vim.keymap.set('n', '<leader>hY', function() harvest.hunk_yy() end, { desc = '[h]unk [Y]ank compare' })

  -- <leader>H
  vim.keymap.set('n', '<leader>Hd', function() harvest.hunk_dd() end, { desc = '[H]unk [d]elete' })
  vim.keymap.set('n', '<leader>Hf', function() harvest.hunk_filename() end, { desc = '[H]unk [f]ilename' })
  vim.keymap.set('n', '<leader>Hl', function() harvest.hunk_line() end, { desc = '[H]unk [l]ine' })
  vim.keymap.set('n', '<leader>HD', function() harvest.hunk_dd() end, { desc = '[H]unk [D]elete' })
  vim.keymap.set('n', '<leader>HY', function() harvest.hunk_yy() end, { desc = '[H]unk [Y]ank compare' })
end
