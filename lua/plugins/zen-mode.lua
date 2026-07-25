do
  vim.pack.add { 'https://github.com/folke/zen-mode.nvim' }
  require('zen-mode').setup {
    on_open = function()
      vim.o.fillchars = [[eob: ,fold: ,foldopen:▼,foldclose:▶,foldsep: ,foldinner: ]]
    end,
  }
end
