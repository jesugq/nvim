do
  local zen_mode = require('zen-mode')

  -- <leader>b
  vim.keymap.set('n', '<leader>bz', function() zen_mode.toggle() end, { desc = 'Buffer zen mode' })
end
