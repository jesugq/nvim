do
  local snacks = require('libfuns.snacks')

  -- <leader>b
  vim.keymap.set('n', '<leader>be', function() Snacks.picker.grep_buffers({ regex = false, }) end, { desc = '[b]uffer [e]xplore grep buffers name' })
  vim.keymap.set('n', '<leader>bE', function() Snacks.picker.grep_buffers({ regex = true, }) end, { desc = '[b]uffer [e]xplore grep buffers regex' })
  vim.keymap.set('n', '<leader>bf', function() Snacks.picker.files({ regex = false, }) end, { desc = '[b]uffer [f]iles fzf name' })
  vim.keymap.set('n', '<leader>bF', function() Snacks.picker.files({ regex = true, }) end, { desc = '[b]uffer [f]iles fzf regex' })
  vim.keymap.set('n', '<leader>bg', function() Snacks.picker.grep({ regex = false, }) end, { desc = '[b]uffer [g]auge grep files name' })
  vim.keymap.set('n', '<leader>bG', function() Snacks.picker.grep({ regex = true, }) end, { desc = '[b]uffer [g]auge grep files regex' })
  vim.keymap.set('n', '<leader>bm', function() Snacks.picker.marks({ focus = 'input', finder = snacks.buffer_marks, transform = function(item) return snacks.person_marks(item) end }) end, { desc = '[b]uffer [m]arks' })
  vim.keymap.set('n', '<leader>bq', function() Snacks.explorer() end, { desc = '[b]uffer [q]uery' })
  vim.keymap.set('n', '<leader>br', function() Snacks.picker.recent({ finder = snacks.recent }) end, { desc = '[b]uffer [r]ecents' })
  vim.keymap.set('n', '<leader>bw', function() Snacks.picker.buffers() end, { desc = '[b]uffer [w]indows' })

  -- <leader>s
  vim.keymap.set('n', '<leader>s"', function() Snacks.picker.registers({ transform = function(item) return snacks.neovim_marks(item) end }) end, { desc = '[s]earch ["] registers' })
  vim.keymap.set('n', '<leader>s/', function() Snacks.picker.search_history() end, { desc = '[s]earch [/] searches' })
  vim.keymap.set('n', '<leader>s:', function() Snacks.picker.command_history() end, { desc = '[s]earch [:] commands' })
  vim.keymap.set('n', '<leader>sh', function() Snacks.picker.help({ focus = 'input' }) end, { desc = '[s]earch [h]elp' })
  vim.keymap.set('n', '<leader>sk', function() Snacks.picker.keymaps({ focus = 'input' }) end, { desc = '[s]earch [k]eymaps' })
  vim.keymap.set('n', '<leader>sm', function() Snacks.picker.marks({ transform = function(item) return snacks.person_marks(item) end }) end, { desc = '[s]earch [m]arks local' })
  vim.keymap.set('n', '<leader>sM', function() Snacks.picker.marks({ transform = function(item) return snacks.neovim_marks(item) end }) end, { desc = '[s]earch [m]arks global' })
  vim.keymap.set('n', '<leader>sq', function() Snacks.picker.registers({ transform = function(item) return snacks.person_marks(item) end }) end, { desc = '[s]earch [q]ueue' })
  vim.keymap.set('n', '<leader>ss', function() Snacks.picker.resume() end, { desc = '[s]earch [s]earch' })

  -- <leader>g
  vim.keymap.set('n', '<leader>g,', function() Snacks.picker.lsp_incoming_calls() end, { desc = '[g]et [,] incoming calls' })
  vim.keymap.set('n', '<leader>g.', function() Snacks.picker.lsp_outgoing_calls() end, { desc = '[g]et [.] outgoing calls' })
  vim.keymap.set('n', '<leader>gd', function() Snacks.picker.lsp_definitions() end, { desc = '[g]et [d]efinitions' })
  vim.keymap.set('n', '<leader>gD', function() Snacks.picker.lsp_declarations() end, { desc = '[g]et [d]eclarations' })
  vim.keymap.set('n', '<leader>gi', function() Snacks.picker.lsp_implementations() end, { desc = '[g]et [i]mplementations' })
  vim.keymap.set('n', '<leader>gr', function() Snacks.picker.lsp_references() end, { desc = '[g]et [r]eferences' })
  vim.keymap.set('n', '<leader>gs', function() Snacks.picker.lsp_symbols() end, { desc = '[g]et [s]ymbols' })
  vim.keymap.set('n', '<leader>gt', function() Snacks.picker.lsp_type_definitions() end, { desc = '[g]et [t]ype definitions' })
  vim.keymap.set('n', '<leader>gw', function() Snacks.picker.lsp_workspace_symbols() end, { desc = '[g]et [w]orkspace symbols' })
end
