do
  -- dependency
  local builtin = require('telescope.builtin')

  -- picker
  vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
  vim.keymap.set('n', '<leader>fc', builtin.command_history, { desc = 'Telescope command history' })
  vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
  vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Telescope oldfiles' })
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
  vim.keymap.set('n', '<leader>f"', builtin.registers, { desc = 'Telescope registers' })
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
  vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope keymaps' })
  vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = 'Telescope marks' })
end
