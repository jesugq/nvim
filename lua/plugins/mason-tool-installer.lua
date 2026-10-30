do
  vim.pack.add { 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' }
  local mason_tool_installer = require('mason-tool-installer')
  mason_tool_installer.setup {
    run_on_start = true,
    ensure_installed = require('libmaps.lsp'),
  }
end
