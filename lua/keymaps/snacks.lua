do
  vim.keymap.set('n', '<leader>e', function() Snacks.explorer() end, { desc = 'Snacks explorer' })

  -- picker
  vim.keymap.set('n', '<leader><leader>', function() Snacks.picker.buffers() end, { desc = 'Snacks picker buffer' })

  vim.keymap.set('n', '<leader>sc', function() Snacks.picker.command_history() end, { desc = 'Snacks picker command history' })
  vim.keymap.set('n', '<leader>sp', function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = 'Snacks picker config files' })
  vim.keymap.set('n', '<leader>sf', function() Snacks.picker.files() end, { desc = 'Snacks picker files' })
  vim.keymap.set('n', '<leader>sr', function() Snacks.picker.recent() end, { desc = 'Snacks picker recent' })
  vim.keymap.set('n', '<leader>sl', function() Snacks.picker.recent() end, { desc = 'Snacks picker git log' })
  vim.keymap.set('n', '<leader>sd', function() Snacks.picker.git_diff() end, { desc = 'Snacks picker git diff' })
  vim.keymap.set('n', '<leader>sg', function() Snacks.picker.grep() end, { desc = 'Snacks picker grep' })
  vim.keymap.set('n', '<leader>s"', function() Snacks.picker.registers() end, { desc = 'Snacks picker registers' })
  vim.keymap.set('n', '<leader>ss', function() Snacks.picker.search_history() end, { desc = 'Snacks picker search history' })
  vim.keymap.set('n', '<leader>sh', function() Snacks.picker.help() end, { desc = 'Snacks picker help' })
  vim.keymap.set('n', '<leader>s"', function() Snacks.picker.registers() end, { desc = 'Snacks picker registers' })
  vim.keymap.set('n', '<leader>sk', function() Snacks.picker.keymaps() end, { desc = 'Snacks picker keymaps' })
  vim.keymap.set('n', '<leader>sm', function() Snacks.picker.marks() end, { desc = 'Snacks picker marks' })

  vim.keymap.set('n', '<leader>bd', function() Snacks.bufdelete() end, { desc = 'Snacks bufdelete' })
end
