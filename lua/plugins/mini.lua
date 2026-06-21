do
  vim.pack.add { 'https://github.com/nvim-mini/mini.nvim' }
  require('mini.move').setup { }
  require('mini.diff').setup { }
  require('mini.statusline').setup { use_icons = true, }
  require('mini.tabline').setup { show_icons = true, }
  require('mini.trailspace').setup { }
end
