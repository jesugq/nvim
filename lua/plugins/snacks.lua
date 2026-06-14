do
  vim.pack.add { 'https://github.com/folke/snacks.nvim' }
  require('snacks').setup {
    explorer = { enabled = true },
    picker = {
      enabled = true,
      sources = {
        explorer = {
          auto_close = true
        },
      },
    },
    bufdelete = { enabled = true },
    indent = { enabled = true },
    notifier = { enabled = true },
  }
end
