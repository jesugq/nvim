do
  local FUNCTION = {}

  FUNCTION.mappings = function()
    -- gr
    vim.keymap.set('n', 'gr,', function() vim.lsp.buf.incoming_calls() end, {
      buffer = true, desc = '[g]et [r]outine [,] incoming calls',
    })
    vim.keymap.set('n', 'gr.', function() vim.lsp.buf.outgoing_calls() end, {
      buffer = true, desc = '[g]et [r]outine [.] outgoing calls',
    })
    vim.keymap.set({'n', 'x',}, 'gra', function() vim.lsp.buf.code_action() end, {
      buffer = true, desc = '[g]et [r]outine [a]ctions',
    })
    vim.keymap.set('n', 'grd', function() vim.lsp.buf.definition() end, {
      buffer = true, desc = '[g]et [r]outine [d]efinitions',
    })
    vim.keymap.set('n', 'grD', function() vim.lsp.buf.declaration() end, {
      buffer = true, desc = '[g]et [r]outine [d]eclarations',
    })
    vim.keymap.set('n', 'grh', function() vim.lsp.buf.hover() end, {
      buffer = true, desc = '[g]et [r]outine [h]over',
    })
    vim.keymap.set('n', 'gri', function() vim.lsp.buf.implementation() end, {
      buffer = true, desc = '[g]et [r]outine [i]mplementation',
    })
    vim.keymap.set('n', 'grn', function() vim.lsp.buf.rename() end, {
      buffer = true, desc = '[g]et [r]outine [n]ame',
    })
    vim.keymap.set('n', 'grr', function() vim.lsp.buf.references() end, {
      buffer = true, desc = '[g]et [r]outine [r]eferences',
    })
    vim.keymap.set('n', 'grt', function() vim.lsp.buf.type_definition() end, {
      buffer = true, desc = '[g]et [r]outine [t]ype definitions',
    })
    vim.keymap.set('n', 'grw', function() vim.lsp.buf.workspace_symbol() end, {
      buffer = true, desc = '[g]et [r]outine [w]orkspace symbols',
    })
    vim.keymap.set('n', 'grx', function() vim.lsp.buf.codelens_run() end, {
      buffer = true, desc = '[g]et [r]outine [x]ecute codelens run',
    })
  end

  return FUNCTION
end
