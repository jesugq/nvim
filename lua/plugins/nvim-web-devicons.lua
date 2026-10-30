do
  vim.pack.add { 'https://github.com/nvim-tree/nvim-web-devicons' }
  local nvim_web_devicons = require('nvim-web-devicons')
  nvim_web_devicons.setup {
    color_icons = true,
    default = true,
  }
end
