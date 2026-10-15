do
  vim.pack.add { 'https://github.com/pteroctopus/faster.nvim' }
  require('faster').setup {
    behaviours = {
      fastmacro = {
        on = false,
      }
    }
  }
end
