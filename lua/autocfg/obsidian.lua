do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    callback = function()
      require('configs.obsidian').indents()
    end,
  })
end
