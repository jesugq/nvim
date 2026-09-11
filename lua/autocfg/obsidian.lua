do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    callback = function()
      require('configs.obsidian').indents()
      require('configs.obsidian').prompts()
      require('configs.obsidian').insight()

      vim.wo.foldmethod = 'expr'
      vim.wo.foldexpr = 'v:lua.vim.lsp.foldexpr()'
      vim.wo.foldtext = 'v:lua.vim.lsp.foldtext()'
    end,
  })
end
