do
  vim.pack.add { 'https://github.com/folke/which-key.nvim' }
  local which_key = require('which-key')

  which_key.setup {
    icons = { mappings = true, },
    plugins = {
      presets = {
        windows = false,
      },
    },
    spec = {
      { '<leader>w', group = 'windows' },
      { '<leader>o', group = 'sessions' },
      { '<leader>b', group = 'buffers' },
      { '<leader>n', group = 'other' },
    },
  }
end
