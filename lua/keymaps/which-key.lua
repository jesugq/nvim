do
  vim.keymap.set('n', '?', function() require('which-key').show({ delay = 0 }) end, { desc = 'Which-key' })
end
