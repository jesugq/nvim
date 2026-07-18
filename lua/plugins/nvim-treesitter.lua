do
  -- https://github.com/neovim-treesitter/treesitter-parser-registry/blob/main/registry.json
  vim.pack.add { 'https://github.com/neovim-treesitter/nvim-treesitter' }
  local treesitter = require('nvim-treesitter')
  treesitter.setup {}
  treesitter.install {
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
    'typescript',
    'ruby',
    'glimmer',
    'glimmer_javascript',
    'glimmer_typescript',
    'markdown',
    'markdown_inline'
  }
end
