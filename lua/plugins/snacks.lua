---@diagnostic disable: different-requires
do
  vim.pack.add { 'https://github.com/folke/snacks.nvim' }
  require('snacks').setup {
    explorer = {
      enabled = true,
      replace_netrw = false,
    },
    picker = {
      enabled = true,
      root = false,
      hidden = true,
      ignored = true,
      sources = {
        explorer = {
          auto_close = true,
        },
      },
    },
    indent = { enabled = true, },
    notifier = { enabled = true, },
    image = { enabled = true, },
    bufdelete = { enabled = true },
  }
end
