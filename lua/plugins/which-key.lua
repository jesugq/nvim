do
  vim.pack.add { 'https://github.com/folke/which-key.nvim' }
  local which_key = require('which-key')

  which_key.setup {
    delay = 0,
    icons = { mappings = true, },
    spec = {
      { '<leader>b', group = '[b]uffer' },
      { '<leader>c', group = '[c]ontext' },
      { '<leader>C', group = '[C]ontext' },
      { '<leader>g', group = '[g]lue' },
      { '<leader>h', group = '[h]unk' },
      { '<leader>H', group = '[H]unk' },
      { '<leader>m', group = '[m]emory' },
      { '<leader>j', group = '[j]umble' },
      { '<leader>o', group = '[o]rigin' },
      { '<leader>q', group = '[q]uarry' },
      { '<leader>v', group = '[v]enture' },
      { '<leader>V', group = '[V]enture' },
    },
  }
end
