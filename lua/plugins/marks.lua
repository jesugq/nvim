---@diagnostic disable: different-requires
do
  vim.pack.add { 'https://github.com/chentoast/marks.nvim' }

  require('marks').setup {
    default_mappings = false,
    mappings = require('keymaps.marks'),
  }
end
