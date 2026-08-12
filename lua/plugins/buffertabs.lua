do
  vim.pack.add { 'https://github.com/tomiis4/BufferTabs.nvim' }
  local buffertabs = require('buffertabs')
  buffertabs.setup {}
  buffertabs.toggle()
end
