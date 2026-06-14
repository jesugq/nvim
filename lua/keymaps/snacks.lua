do
  -- explorer
  vim.keymap.set('n', '<leader>e', function() Snacks.explorer() end, { desc = 'Snacks explorer' })

  -- picker
  vim.keymap.set('n', '<leader>fb', function() Snacks.picker.buffers() end, { desc = 'Snacks picker buffer' })
  vim.keymap.set('n', '<leader>fc', function() Snacks.picker.command_history() end, { desc = 'Snacks picker command history' })
  vim.keymap.set('n', '<leader>ff', function() Snacks.picker.files() end, { desc = 'Snacks picker files' })
  vim.keymap.set('n', '<leader>fr', function() Snacks.picker.recent() end, { desc = 'Snacks picker recent' })
  vim.keymap.set('n', '<leader>fg', function() Snacks.picker.grep() end, { desc = 'Snacks picker grep' })
  vim.keymap.set('n', '<leader>f"', function() Snacks.picker.registers() end, { desc = 'Snacks picker registers' })
  vim.keymap.set('n', '<leader>fh', function() Snacks.picker.help() end, { desc = 'Snacks picker help' })
  vim.keymap.set('n', '<leader>fk', function() Snacks.picker.keymaps() end, { desc = 'Snacks picker keymaps' })
  vim.keymap.set('n', '<leader>fm', function() Snacks.picker.marks() end, { desc = 'Snacks picker marks' })

  -- bufdelete
  vim.keymap.set('n', '<leader>bd', function() Snacks.bufdelete() end, { desc = 'Snacks bufdelete' })
end
