do
  vim.pack.add { 'https://github.com/nvim-mini/mini.nvim' }
  local move = require('mini.move')
  local cursorword = require('mini.cursorword')
  move.setup { }
  cursorword.setup { delay = 1000, }
end
