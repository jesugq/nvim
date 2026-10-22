do
  vim.pack.add { 'https://github.com/folke/which-key.nvim' }
  local which_key = require('which-key')

  which_key.setup {
    icons = { mappings = true, },
    spec = {
      { '<leader>b', group = 'buffers' },
      { '<leader>c', group = 'callers' },
      { '<leader>g', group = 'gadgets' },
      { '<leader>h', group = 'hunkers' },
      { '<leader>q', group = 'quivers' },
      { '<leader>s', group = 'seeders' },
    },
  }
end
