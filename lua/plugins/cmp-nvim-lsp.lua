do
  vim.pack.add { 'https://github.com/hrsh7th/cmp-nvim-lsp' }
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  local ensure_installed = require('lsp')

  for _, ensured in ipairs(ensure_installed) do
    vim.lsp.config(ensured, {
      capabilities = capabilities
    })
    -- vim.lsp.enable(ensured)
  end
end
