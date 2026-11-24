do
  local which_key = require('which-key')

  vim.keymap.set('n', '<leader>?', function() which_key.show({ delay = 0 }) end, { desc = 'which-key' })
end
