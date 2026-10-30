do
  vim.pack.add { 'https://github.com/folke/which-key.nvim' }
  local which_key = require('which-key')

  which_key.setup {
    icons = { mappings = true, },
    spec = {
      { '<leader>b', group = '[b]uffer' },
      { '<leader>c', group = '[c]opy' },
      { '<leader>g', group = '[g]et' },
      { '<leader>h', group = '[h]unk' },
      { '<leader>q', group = '[q]uest' },
      { '<leader>s', group = '[s]earch' },
      { 'gr', group = '[g]et [r]outine' },
    },
  }
end
