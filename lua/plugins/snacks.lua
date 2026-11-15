---@diagnostic disable: different-requires
do
  vim.pack.add { 'https://github.com/folke/snacks.nvim' }
  local snacks = require('snacks')
  snacks.setup {
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
        grep = {
          focus = 'input',
          regex = false,
        },
        grep_buffers = {
          focus = 'input',
          regex = false,
        },
        buffers = {
          focus = 'input',
          current = true,
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
        registers = {
          focus = 'list',
        },
        marks = {
          focus = 'list',
        },
      },
    },
    notifier = { enabled = true, },
    image = { enabled = false, },
    input = { enabled = true, },
  }
end
