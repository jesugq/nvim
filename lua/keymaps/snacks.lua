do
  local snacks = require('libfuns.snacks')

  -- <leader><leader>
  vim.keymap.set('n', '<leader><leader>', function() Snacks.explorer() end, { desc = 'Snacks explorer' })

  -- <leader>b
  vim.keymap.set('n', '<leader>be', function() Snacks.picker.grep_buffers({ regex = false, }) end, { desc = 'Snacks picker grep buffers' })
  vim.keymap.set('n', '<leader>bE', function() Snacks.picker.grep_buffers({ regex = true, }) end, { desc = 'Snacks picker grep buffers regex' })
  vim.keymap.set('n', '<leader>bf', function() Snacks.picker.files({ regex = false, }) end, { desc = 'Snacks picker files' })
  vim.keymap.set('n', '<leader>bF', function() Snacks.picker.files({ regex = true, }) end, { desc = 'Snacks picker files' })
  vim.keymap.set('n', '<leader>bg', function() Snacks.picker.grep({ regex = false, }) end, { desc = 'Snacks picker grep' })
  vim.keymap.set('n', '<leader>bG', function() Snacks.picker.grep({ regex = true, }) end, { desc = 'Snacks picker grep regex' })
  vim.keymap.set('n', '<leader>bm', function() Snacks.picker.marks({ focus = 'input', finder = snacks.buffer_marks, transform = function(item) return snacks.person_marks(item) end }) end, { desc = 'Snacks picker marks in open buffers' })
  vim.keymap.set('n', '<leader>bw', function() Snacks.picker.buffers() end, { desc = 'Snacks window' })

  -- <leader>s
  vim.keymap.set('n', '<leader>sh', function() Snacks.picker.help({ focus = 'input' }) end, { desc = 'Snacks picker help' })
  vim.keymap.set('n', '<leader>sk', function() Snacks.picker.keymaps({ focus = 'input' }) end, { desc = 'Snacks picker keymaps' })
  vim.keymap.set('n', '<leader>sm', function() Snacks.picker.marks({ transform = function(item) return snacks.person_marks(item) end }) end, { desc = 'Snacks picker marks local' })
  vim.keymap.set('n', '<leader>sM', function() Snacks.picker.marks({ transform = function(item) return snacks.neovim_marks(item) end }) end, { desc = 'Snacks picker marks global' })
  vim.keymap.set('n', '<leader>sq', function() Snacks.picker.registers({ transform = function(item) return snacks.person_marks(item) end }) end, { desc = 'Snacks picker macro registers' })
  vim.keymap.set('n', '<leader>ss', function() Snacks.picker.resume() end, { desc = 'Snacks picker resume' })
  vim.keymap.set('n', '<leader>s:', function() Snacks.picker.command_history() end, { desc = 'Snacks picker command history' })
  vim.keymap.set('n', '<leader>s/', function() Snacks.picker.search_history() end, { desc = 'Snacks picker search history' })
  vim.keymap.set('n', '<leader>s"', function() Snacks.picker.registers({ transform = function(item) return snacks.neovim_marks(item) end }) end, { desc = 'Snacks picker numbered/default registers' })

  -- <leader>g
  vim.keymap.set('n', '<leader>g,', function() Snacks.picker.lsp_incoming_calls() end, { desc = 'Snacks picker LSP incoming calls' })
  vim.keymap.set('n', '<leader>g.', function() Snacks.picker.lsp_outgoing_calls() end, { desc = 'Snacks picker LSP outgoing calls' })
  vim.keymap.set('n', '<leader>gd', function() Snacks.picker.lsp_definitions() end, { desc = 'Snacks picker LSP definitions' })
  vim.keymap.set('n', '<leader>gD', function() Snacks.picker.lsp_declarations() end, { desc = 'Snacks picker LSP declarations' })
  vim.keymap.set('n', '<leader>gi', function() Snacks.picker.lsp_implementations() end, { desc = 'Snacks picker LSP implementations' })
  vim.keymap.set('n', '<leader>gr', function() Snacks.picker.lsp_references() end, { desc = 'Snacks picker LSP references' })
  vim.keymap.set('n', '<leader>gs', function() Snacks.picker.lsp_symbols() end, { desc = 'Snacks picker LSP document symbols' })
  vim.keymap.set('n', '<leader>gt', function() Snacks.picker.lsp_type_definitions() end, { desc = 'Snacks picker LSP type definitions' })
  vim.keymap.set('n', '<leader>gw', function() Snacks.picker.lsp_workspace_symbols() end, { desc = 'Snacks picker LSP workspace symbols' })
end
