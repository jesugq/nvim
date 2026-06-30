do
  vim.pack.add { 'https://github.com/folke/which-key.nvim' }
  require('which-key').setup {
    delay = 500,
    icons = { mappings = true },
    spec = { },
  }
end
