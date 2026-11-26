do
  local snacks = require('libfuns.snacks')

  -- <leader>b
  vim.keymap.set('n', '<leader>bc', function() Snacks.bufdelete() end, { desc = '[b]uffer [c]lose' })
  vim.keymap.set('n', '<leader>be', function() Snacks.picker.explorer({ finder = snacks.explorer_buffers('buffer') }) end, { desc = '[b]uffer [e]xplore' })
  vim.keymap.set('n', '<leader>bf', function() Snacks.picker.buffers({ finder = snacks.buffer_files(vim.api.nvim_get_current_buf()) }) end, { desc = '[b]uffer [f]ind' })
  vim.keymap.set('n', '<leader>bg', function() Snacks.picker.grep_buffers({ focus = 'input', finder = snacks.buffer_grep() }) end, { desc = '[b]uffer [g]rep' })
  vim.keymap.set('n', '<leader>bm', function() Snacks.picker.marks({ finder = snacks.buffer_marks, transform = function(item) return snacks.person_marks(item) end }) end, { desc = '[b]uffer [m]arks' })

  -- <leader>w
  vim.keymap.set('n', '<leader>we', function() Snacks.picker.explorer({ finder = snacks.explorer_buffers('window') }) end, { desc = '[w]indows [e]xplore' })
  vim.keymap.set('n', '<leader>wf', function() Snacks.picker.buffers({ finder = snacks.window_files }) end, { desc = '[w]indows [f]ind' })
  vim.keymap.set('n', '<leader>wg', function() Snacks.picker.grep_buffers({ focus = 'input', finder = snacks.window_grep }) end, { desc = '[w]indows [g]rep visible buffers' })
  vim.keymap.set('n', '<leader>wm', function() Snacks.picker.marks({ finder = snacks.window_marks, transform = function(item) return snacks.person_marks(item) end }) end, { desc = '[w]indows [m]arks' })

  -- <leader>j
  vim.keymap.set('n', '<leader>je', function() Snacks.picker.explorer({ finder = snacks.explorer_buffers('jumble') }) end, { desc = '[j]umble [e]xplore' })
  vim.keymap.set('n', '<leader>jf', function() Snacks.picker.buffers() end, { desc = '[j]umble [f]ind' })
  vim.keymap.set('n', '<leader>jg', function() Snacks.picker.grep_buffers() end, { desc = '[j]umble [g]rep' })
  vim.keymap.set('n', '<leader>jm', function() Snacks.picker.marks({ finder = snacks.jumble_marks, transform = function(item) return snacks.person_marks(item) end }) end, { desc = '[j]umble [m]arks' })

  -- <leader>o
  vim.keymap.set('n', '<leader>oe', function() Snacks.explorer() end, { desc = '[o]pen [e]xplore' })
  vim.keymap.set('n', '<leader>or', function() Snacks.picker.recent({ finder = snacks.open_recent }) end, { desc = '[o]pen [r]ecents' })
  vim.keymap.set('n', '<leader>o"', function() Snacks.picker.registers({ transform = function(item) return snacks.neovim_marks(item) end }) end, { desc = '[o]pen ["] registers' })
  vim.keymap.set('n', '<leader>o/', function() Snacks.picker.search_history() end, { desc = '[o]pen [/] searches' })
  vim.keymap.set('n', '<leader>o:', function() Snacks.picker.command_history() end, { desc = '[o]pen [:] commands' })
  vim.keymap.set('n', '<leader>of', function() Snacks.picker.files() end, { desc = '[o]pen [f]ind' })
  vim.keymap.set('n', '<leader>og', function() Snacks.picker.grep() end, { desc = '[o]pen [g]rep' })
  vim.keymap.set('n', '<leader>oq', function() Snacks.picker.registers({ transform = function(item) return snacks.person_marks(item) end, confirm = snacks.copy_register_to_macro }) end, { desc = '[o]pen [q]ueue' })

  -- <leader>g
  vim.keymap.set('n', '<leader>g,', function() Snacks.picker.lsp_incoming_calls() end, { desc = '[g]et [,] incoming calls' })
  vim.keymap.set('n', '<leader>g.', function() Snacks.picker.lsp_outgoing_calls() end, { desc = '[g]et [.] outgoing calls' })
  vim.keymap.set('n', '<leader>gd', function() Snacks.picker.lsp_definitions() end, { desc = '[g]et [d]efinitions' })
  vim.keymap.set('n', '<leader>gD', function() Snacks.picker.lsp_declarations() end, { desc = '[g]et [D]eclarations' })
  vim.keymap.set('n', '<leader>gi', function() Snacks.picker.lsp_implementations() end, { desc = '[g]et [i]mplementations' })
  vim.keymap.set('n', '<leader>gr', function() Snacks.picker.lsp_references() end, { desc = '[g]et [r]eferences' })
  vim.keymap.set('n', '<leader>gs', function() Snacks.picker.lsp_symbols() end, { desc = '[g]et [s]ymbols' })
  vim.keymap.set('n', '<leader>gt', function() Snacks.picker.lsp_type_definitions() end, { desc = '[g]et [t]ype definitions' })
  vim.keymap.set('n', '<leader>gw', function() Snacks.picker.lsp_workspace_symbols() end, { desc = '[g]et [w]orkspace symbols' })
end
