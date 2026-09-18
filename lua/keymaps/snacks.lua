do
  local human_marks = function(item)
    if item.label and item.label:match("^[a-zA-Z]$") then
      return item
    end
    return false
  end

  local nevim_marks = function(item)
    if item.label and item.label:match("^[a-zA-Z]$") then
      return false
    end
    return item
  end

  -- <C-b>
  vim.keymap.set('n', '<C-b>e', function() Snacks.explorer() end, { desc = 'Snacks explorer' })
  vim.keymap.set('n', '<C-b>w', function() Snacks.picker.buffers() end, { desc = 'Snacks window' })
  vim.keymap.set('n', '<C-b>r', function() Snacks.picker.recent() end, { desc = 'Snacks recent' })
  vim.keymap.set('n', '<C-b>f', function() Snacks.picker.files({ regex = false, }) end, { desc = 'Snacks picker files' })
  vim.keymap.set('n', '<C-b>F', function() Snacks.picker.files({ regex = true, }) end, { desc = 'Snacks picker files' })
  vim.keymap.set('n', '<C-b>x', function() Snacks.bufdelete() end, { desc = 'Snacks bufdelete' })
  vim.keymap.set('n', '<C-b>X', function() Snacks.bufdelete.all() end, { desc = 'Snacks bufdelete all' })
  vim.keymap.set('n', '<C-b>g', function() Snacks.picker.grep({ regex = false, }) end, { desc = 'Snacks picker grep' })
  vim.keymap.set('n', '<C-b>G', function() Snacks.picker.grep({ regex = true, }) end, { desc = 'Snacks picker grep regex' })
  vim.keymap.set('n', '<C-b>b', function() Snacks.picker.grep_buffers({ regex = false, }) end, { desc = 'Snacks picker grep buffers' })
  vim.keymap.set('n', '<C-b>B', function() Snacks.picker.grep_buffers({ regex = true, }) end, { desc = 'Snacks picker grep buffers regex' })

  -- <leader>s
  vim.keymap.set('n', '<leader>ss', function() Snacks.picker.resume() end, { desc = 'Snacks picker resume' })
  vim.keymap.set('n', '<leader>s:', function() Snacks.picker.command_history() end, { desc = 'Snacks picker command history' })
  vim.keymap.set('n', '<leader>s/', function() Snacks.picker.search_history() end, { desc = 'Snacks picker search history' })
  vim.keymap.set('n', '<leader>s"', function() Snacks.picker.registers() end, { desc = 'Snacks picker registers' })
  vim.keymap.set('n', '<leader>sq', function() Snacks.picker.registers() end, { desc = 'Snacks picker registers' })
  vim.keymap.set('n', '<leader>sm', function() Snacks.picker.marks({ transform = function(item) return human_marks(item) end }) end, { desc = 'Snacks picker marks local' })
  vim.keymap.set('n', '<leader>sM', function() Snacks.picker.marks({ transform = function(item) return nevim_marks(item) end }) end, { desc = 'Snacks picker marks global' })
  vim.keymap.set('n', '<leader>sh', function() Snacks.picker.help({ focus = 'input' }) end, { desc = 'Snacks picker help' })
  vim.keymap.set('n', '<leader>sk', function() Snacks.picker.keymaps({ focus = 'input' }) end, { desc = 'Snacks picker keymaps' })

  -- gs
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
