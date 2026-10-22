do
  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function()
      require('libkeys.nvim-lspconfig').mappings()
    end,
  })
end
