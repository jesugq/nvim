---@diagnostic disable: different-requires
do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'org',
    callback = function()
      local tom = require('telescope-orgmode')

      vim.keymap.set('n', '<C-c>r', tom.refile_heading, { desc = 'Org refile text' })
    end,
  })
end
