do
  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function()
      vim.keymap.set({'n', 'v'}, 'gra', function() vim.lsp.buf.code_action() end, {
        buffer = true, desc = 'LSP Code Action'
      })
      vim.keymap.set('n', 'gri', function() vim.lsp.buf.implementation() end, {
        buffer = true, desc = 'LSP Implementation'
      })
      vim.keymap.set('n', 'grn', function() vim.lsp.buf.rename() end, {
        buffer = true, desc = 'LSP Rename'
      })
      vim.keymap.set('n', 'grr', function() vim.lsp.buf.references() end, {
        buffer = true, desc = 'LSP References'
      })
      vim.keymap.set('n', 'grt', function() vim.lsp.buf.type_definition() end, {
        buffer = true, desc = 'LSP Type Definition'
      })
      vim.keymap.set('n', 'grx', function() vim.lsp.buf.codelens_run() end, {
        buffer = true, desc = 'LSP Codelens Run'
      })
      vim.keymap.set('n', 'gO', '<Nop>', { desc = 'LSP Document Symbol' })
      vim.keymap.set('n', 'grs', function() vim.lsp.buf.document_symbol() end, {
        buffer = true, desc = 'LSP Document Symbol'
      })

      vim.keymap.set('n', 'grh', function() vim.lsp.buf.hover() end, {
        buffer = true, desc = 'LSP Hover'
      })
      vim.keymap.set('n', 'grd', function() vim.lsp.buf.definition() end, {
        buffer = true, desc = 'LSP Definition'
      })
      vim.keymap.set('n', 'grD', function() vim.lsp.buf.declaration() end, {
        buffer = true, desc = 'LSP Declaration'
      })
      vim.keymap.set('n', 'gr,', function() vim.lsp.buf.incoming_calls() end, {
        buffer = true, desc = 'LSP Incoming Calls'
      })
      vim.keymap.set('n', 'gr.', function() vim.lsp.buf.outgoing_calls() end, {
        buffer = true, desc = 'LSP Outgoing Calls'
      })
      vim.keymap.set('n', 'grw', function() vim.lsp.buf.workspace_symbol() end, {
        buffer = true, desc = 'LSP Workspace Symbol'
      })
    end
  })
end
