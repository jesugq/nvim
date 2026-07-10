do
  vim.keymap.set('n', '<leader>e', function() Snacks.explorer() end, { desc = 'Snacks explorer' })

  vim.keymap.set('n', '<leader>fb', function() Snacks.picker.buffers() end, { desc = 'Snacks picker buffer' })
  vim.keymap.set('n', '<leader>fr', function() Snacks.picker.recent({ limit = 500, filter = { cwd = true } }) end, { desc = 'Snacks picker recent' })
  vim.keymap.set('n', '<leader>ff', function() Snacks.picker.files() end, { desc = 'Snacks picker files' })
  vim.keymap.set('n', '<leader>fg', function() Snacks.picker.grep() end, { desc = 'Snacks picker grep' })

  vim.keymap.set('n', '<leader>s:', function() Snacks.picker.command_history() end, { desc = 'Snacks picker command history' })
  vim.keymap.set('n', '<leader>s/', function() Snacks.picker.search_history() end, { desc = 'Snacks picker search history' })
  vim.keymap.set('n', '<leader>s"', function() Snacks.picker.registers() end, { desc = 'Snacks picker registers' })
  vim.keymap.set('n', '<leader>sm', function() Snacks.picker.marks() end, { desc = 'Snacks picker marks' })
  vim.keymap.set('n', '<leader>sh', function() Snacks.picker.help() end, { desc = 'Snacks picker help' })
  vim.keymap.set('n', '<leader>sk', function() Snacks.picker.keymaps() end, { desc = 'Snacks picker keymaps' })
end
