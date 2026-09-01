---@diagnostic disable: different-requires
do
  vim.pack.add { 'https://github.com/folke/zen-mode.nvim' }
  require('zen-mode').setup {
    window = {
      width = 1,
    },
    on_open = function()
      require('configs.fillchars').highlights()
      require('configs.orgmode').highlights()
    end,
  }
end
