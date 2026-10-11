do
  vim.pack.add { 'https://github.com/nvim-mini/mini.nvim' }
  require('mini.move').setup { }
  require('mini.trailspace').setup { }
  require('mini.cursorword').setup { delay = 1000, }
end
