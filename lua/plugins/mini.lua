do
  vim.pack.add { 'https://github.com/nvim-mini/mini.nvim' }
  require('mini.move').setup { }
  require('mini.diff').setup { }
  require('mini.statusline').setup { use_icons = true, }
  require('mini.trailspace').setup { }
  require('mini.cursorword').setup { delay = 500, }
end
