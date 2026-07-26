do
  vim.pack.add { 'https://github.com/nvimdev/dashboard-nvim' }
  require('dashboard').setup {
    theme = 'hyper',
    config = {
      week_header = {
        enable = true,
      },
    },
  }
end
