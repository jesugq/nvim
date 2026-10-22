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
    'typescript',
    'ruby',
    'glimmer',
    'glimmer_javascript',
    'glimmer_typescript',
    -- 'norg',
    'svelte',
    'typst',
    'vue',
    'tsx',
    'regex',
    'markdown',
    'markdown_inline',
  }

  return OBJECT
end
