do
  vim.pack.add { 'https://github.com/shortcuts/no-neck-pain.nvim' }
  require('no-neck-pain').setup({
    fallbackOnBufferDelete = true,
    autocmds = {
      enableOnVimEnter = true,
      skipEnteringNoNeckPainBuffer = true,
    },
    mappings = require('keymaps.no-neck-pain'),
  })
end
