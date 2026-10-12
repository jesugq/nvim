---@diagnostic disable: different-requires
do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'org',
    callback = function()
      local tom = require('telescope-orgmode')

      -- <leader>n
      vim.keymap.set('n', '<leader>nr', tom.refile_heading, { desc = 'Org refile text' })
    end,
  })
end
