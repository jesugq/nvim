do
  local which_key = require('which-key')

  vim.keymap.set('n', '?', function() which_key.show({ delay = 0 }) end, { desc = 'which-key' })
end
