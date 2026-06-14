do
  vim.pack.add { 'https://github.com/WhoIsSethDaniel/mason-tool-installer' }
  require('mason-tool-installer').setup {
    ensure_installed = {
      'stylua',
      'lua_ls',
    },
    auto_update = true,
    run_on_start = true,
  }
end
