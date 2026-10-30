do
  vim.pack.add { 'https://github.com/rachartier/tiny-glimmer.nvim' }
  local tiny_glimmer = require('tiny-glimmer')
  tiny_glimmer.setup {
    enabled = true,
    overwrite = {
      auto_map = true,
      yank = {
        enabled = true,
      },
      search = {
        enabled = true,
        next_mapping = 'n',
        prev_mapping = 'N',
      },
      paste = {
        enabled = true,
        paste_mapping = 'p',
        Paste_mapping = 'P',
      },
      undo = {
        enabled = true,
        undo_mapping = 'u',
      },
      redo = {
        enabled = true,
        redo_mapping = '<C-r>',
      },
    },
  }
end
