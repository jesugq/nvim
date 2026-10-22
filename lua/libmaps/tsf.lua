do
  local OBJECT = {}

  -- https://github.com/neovim-treesitter/treesitter-parser-registry/blob/main/registry.json
  OBJECT = {
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
    'markdown_inline',
  }

  return OBJECT
end
