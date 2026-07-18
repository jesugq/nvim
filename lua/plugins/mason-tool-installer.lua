do
  -- https://mason-registry.dev/registry/list
  vim.pack.add { 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' }
  require('mason-tool-installer').setup {
    run_on_start = true,
    ensure_installed = {
      'html',
      'cssls',
      'jsonls',
      'yamlls',
      'bashls',
      'lua_ls',
      'ts_ls',
      'ruby_lsp',
      'ember',
      'markdown-oxide',
      'marksman',
    },
  }
end
