---@diagnostic disable: different-requires
do
  vim.pack.add { 'https://github.com/neovim-treesitter/nvim-treesitter' }
  local treesitter = require('nvim-treesitter')
  treesitter.setup {}
  treesitter.install( require('tss') )
end
