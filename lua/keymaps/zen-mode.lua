do
  local zen_mode = require('zen-mode')

  -- <leader>b
  vim.keymap.set('n', '<leader>z', function() zen_mode.toggle() end, { desc = '[z]en mode' })
end
