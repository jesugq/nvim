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
      hidden = true,
      ignored = true,
      sources = {
        explorer = {
          auto_close = true,
          win = {
            list = {
              keys = {
                ["y"] = "yank_relative_cwd",
                ["Y"] = "yank_relative_home",
              }
            }
          },
          actions = {
            yank_relative_cwd = function(_, item)
              if not item then return end
              local path = vim.fn.fnamemodify(item.file, ":.")
              vim.fn.setreg("+", path)  -- System clipboard
              vim.fn.setreg('"', path)  -- Unnamed register
              vim.notify("Yanked CWD relative: " .. path)
            end,
            yank_relative_home = function(_, item)
              if not item then return end
              local path = vim.fn.fnamemodify(item.file, ":~")
              vim.fn.setreg("+", path)
              vim.fn.setreg('"', path)
              vim.notify("Yanked Home relative: " .. path)
            end,
          },
        },
      },
    },
    indent = { enabled = true, },
    notifier = { enabled = true, },
    image = { enabled = true, },
  }
end
