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

  -- vim.keymap.set('n', '<leader>lf', function() Snacks.picker.lsp_definitions() end, { desc = 'Snacks picker lsp definitions' })
  -- vim.keymap.set('n', '<leader>lc', function() Snacks.picker.lsp_declarations() end, { desc = 'Snacks picker lsp declarations' })
  -- vim.keymap.set('n', '<leader>lr', function() Snacks.picker.lsp_references() end, { desc = 'Snacks picker lsp references' })
  -- vim.keymap.set('n', '<leader>li', function() Snacks.picker.lsp_implementations() end, { desc = 'Snacks picker lsp implementations' })
  -- vim.keymap.set('n', '<leader>lt', function() Snacks.picker.lsp_type_definitions() end, { desc = 'Snacks picker lsp type definitions' })
  -- vim.keymap.set('n', '<leader>l<', function() Snacks.picker.lsp_incoming_calls() end, { desc = 'Snacks picker lsp incoming calls' })
  -- vim.keymap.set('n', '<leader>l>', function() Snacks.picker.lsp_outgoing_calls() end, { desc = 'Snacks picker lsp outgoing calls' })
  -- vim.keymap.set('n', '<leader>ls', function() Snacks.picker.lsp_symbols() end, { desc = 'Snacks picker lsp symbols' })
  -- vim.keymap.set('n', '<leader>lw', function() Snacks.picker.lsp_workspace_symbols() end, { desc = 'Snacks picker lsp workspace symbols' })
end
