do
  vim.pack.add { 'https://github.com/folke/snacks.nvim' }
  require('snacks').setup {
    explorer = { enabled = true },
    picker = {
      enabled = true,
      hidden = true,
      sources = {
        explorer = {
          auto_close = true,
        },
      },
    },
    indent = { enabled = true, },
    notifier = { enabled = true, },
    image = { enabled = true, },
  }
end
