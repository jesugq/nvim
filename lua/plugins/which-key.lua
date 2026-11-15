do
  vim.pack.add { 'https://github.com/folke/which-key.nvim' }
  local which_key = require('which-key')

  which_key.setup {
    delay = 0,
    icons = { mappings = true, },
    spec = {
      { '<leader>b', group = '[b]uffer' },
      { '<leader>c', group = '[c]opy' },
      { '<leader>C', group = '[C]opy' },
      { '<leader>g', group = '[g]et' },
      { '<leader>h', group = '[h]unk' },
      { '<leader>m', group = '[m]emory' },
      { '<leader>n', group = '[n]ook' },
      { '<leader>o', group = '[o]pen' },
      { '<leader>q', group = '[q]uest' },
      { '<leader>v', group = '[v]iew' },
      { '<leader>V', group = '[V]iew' },
    },
  }
end
