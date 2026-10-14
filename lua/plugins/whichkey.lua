do
  vim.pack.add { 'https://github.com/folke/which-key.nvim' }
  local which_key = require('which-key')

  which_key.setup {
    icons = { mappings = true, },
    plugins = {
      presets = {
        windows = false
      },
    },
    spec = {
      { '<leader>a', group = 'actions' },
      { '<leader>b', group = 'buffers' },
      { '<leader>c', group = 'callers' },
      { '<leader>g', group = 'gadgets' },
      { '<leader>h', group = 'hunkers' },
      { '<leader>n', group = 'nickels' },
      { '<leader>o', group = 'objects' },
      { '<leader>q', group = 'quivers' },
      { '<leader>w', group = 'windows' },
    },
  }
end
