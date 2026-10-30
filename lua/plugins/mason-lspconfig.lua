do
  vim.pack.add { 'https://github.com/mason.org/mason-lspconfig.nvim' }
  local mason_lspconfig = require('mason-lspconfig')
  mason_lspconfig.setup {
    automatic_enable = {
      exclude = {
        'lua_ls',
      },
    },
  }
end
