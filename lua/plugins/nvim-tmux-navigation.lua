---@diagnostic disable: different-requires
do
  vim.pack.add { 'https://github.com/alexghergh/nvim-tmux-navigation' }
  local nvim_tmux_nav = require('nvim-tmux-navigation')
  nvim_tmux_nav.setup {
    disable_when_zoomed = false,
  }
end
