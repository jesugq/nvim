do
  vim.pack.add { 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' }
  require('mason-tool-installer').setup {
    run_on_start = true,
    ensure_installed = require('lsp'),
  }
end
