do
  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function()
      local nvim_lspconfig = require('libkeys.nvim-lspconfig')
      nvim_lspconfig.mappings()
    end,
  })
end
