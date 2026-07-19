do
  vim.keymap.set('n', '<leader>e', function() Snacks.explorer() end, { desc = 'Snacks explorer' })
  vim.keymap.set('n', '<leader>w', function() Snacks.picker.buffers( { focus = 'list' }) end, { desc = 'Snacks picker buffer' })

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

  vim.keymap.set('n', 'gsi', function() Snacks.picker.lsp_implementations() end, { desc = 'Snacks picker LSP implementations' })
  vim.keymap.set('n', 'gsr', function() Snacks.picker.lsp_references() end, { desc = 'Snacks picker LSP references' })
  vim.keymap.set('n', 'gst', function() Snacks.picker.lsp_type_definitions() end, { desc = 'Snacks picker LSP type definitions' })
  vim.keymap.set('n', 'gss', function() Snacks.picker.lsp_symbols() end, { desc = 'Snacks picker LSP document symbols' })
  vim.keymap.set('n', 'gsd', function() Snacks.picker.lsp_definitions() end, { desc = 'Snacks picker LSP definitions' })
  vim.keymap.set('n', 'gsD', function() Snacks.picker.lsp_declarations() end, { desc = 'Snacks picker LSP declarations' })
  vim.keymap.set('n', 'gs,', function() Snacks.picker.lsp_incoming_calls() end, { desc = 'Snacks picker LSP incoming calls' })
  vim.keymap.set('n', 'gs.', function() Snacks.picker.lsp_outgoing_calls() end, { desc = 'Snacks picker LSP outgoing calls' })
  vim.keymap.set('n', 'gsw', function() Snacks.picker.lsp_workspace_symbols() end, { desc = 'Snacks picker LSP workspace symbols' })
end
