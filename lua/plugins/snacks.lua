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
      focus = 'list',
      root = false,
      hidden = true,
      ignored = true,
      sources = {
        explorer = {
          auto_close = true,
        },
      },
    },
    notifier = { enabled = true, },
    image = { enabled = true, },
    bufdelete = { enabled = true, },
    input = { enabled = true, },
  }
end
