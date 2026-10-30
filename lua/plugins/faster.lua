do
  vim.pack.add { 'https://github.com/pteroctopus/faster.nvim' }
  local faster = require('faster')
  faster.setup {
    behaviours = {
      fastmacro = {
        on = false,
      }
    }
  }
end
