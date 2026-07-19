do
  local path = require('path')

  vim.pack.add { 'https://github.com/obsidian-nvim/obsidian.nvim' }
  require('obsidian').setup {
    legacy_commands = false,
    workspaces = {
      {
        name = 'Markdown',
        path = path.md_dir,
      }
    },
    picker = {
      name = 'snacks.picker',
    },
    checkbox = { enabled = false, },
    frontmatter = { enabled = false, },
    attachments = {
      folder = 'attachments',
      img_name_func = function()
        return string.format("%s ", os.date("%Y-%m-%d"))
      end,
    },
  }
end
