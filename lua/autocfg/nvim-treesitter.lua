do
  -- https://github.com/neovim-treesitter/treesitter-parser-registry/blob/main/registry.json
  vim.api.nvim_create_autocmd('FileType', {
    pattern = {
      'html',
      'html_tags',
      'css',
      'scss',
      'json',
      'json5',
      'yaml',
      'bash',
      'lua',
      'javascript',
      'js',
      'typescript',
      'ts',
      'ruby',
      'glimmer',
      'markdown',
    },
    callback = function()
      vim.treesitter.start()
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.wo.foldmethod = 'expr'
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })
end
