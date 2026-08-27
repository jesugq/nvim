do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    callback = function()
      require('configs.obsidian').indents()
      require('configs.obsidian').prompts()
      require('configs.obsidian').insight()
    end,
  })
end
