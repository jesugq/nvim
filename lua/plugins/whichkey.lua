do
  vim.pack.add { 'https://github.com/folke/which-key.nvim' }
  local which_key = require('which-key')

  which_key.setup {
    delay = 500,
    icons = { mappings = true, },
    spec = { },
  }
  which_key.add({
    { '<leader>e', group = 'Explorer', },
    { '<leader>w', group = 'Windows', },
    { '<leader>r', group = 'Recents', },
    { '<leader>h', group = 'Hunk', },
    { '<leader>q', group = 'Quit', },
    { '<leader>s', group = 'Search', },
    { '<leader>y', group = 'Yank', },
    { '<C-w>c', hidden = true, },
    { '<C-w>h', hidden = true, },
    { '<C-w>j', hidden = true, },
    { '<C-w>k', hidden = true, },
    { '<C-w>l', hidden = true, },
    { 'gO', hidden = true, },
  })
end
