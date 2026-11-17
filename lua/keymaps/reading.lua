do
  local reading = require('libfuns.reading')

  -- <leader>h
  vim.keymap.set('n', '<leader>hc', function() reading.hunk_compare('') end, { desc = '[h]unk [C]ompare local' })
  vim.keymap.set('n', '<leader>hC', function() reading.hunk_compare('origin/') end, { desc = '[h]unk [c]ompare origin' })
  vim.keymap.set('n', '<leader>hv', function() reading.hunk_view() end, { desc = '[h]unk [v]iew' })
end
