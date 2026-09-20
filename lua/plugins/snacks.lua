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
      focus = 'list',
      hidden = true,
      ignored = true,
      layout = {
        preset = 'default',
      },
      sources = {
        buffers = {
          current = false,
        },
        explorer = {
          auto_close = true,
          layout = {
            preset = 'default',
            preview = true,
          },
        },
        recent = {
          limit = 500,
          filter = { cwd = true, },
        },
        files = {
          focus = 'input',
          hidden = true,
          ignored = true,
        },
        grep = {
          focus = 'input',
        },
        grep_buffers = {
          focus = 'input',
        },
      },
    },
    notifier = { enabled = true, },
    image = { enabled = false, },
    bufdelete = { enabled = true, },
    input = { enabled = true, },
  }
end
