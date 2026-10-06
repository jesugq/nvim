do
  vim.pack.add { 'https://github.com/kevalin/mermaid.nvim' }
  require('mermaid').setup {
    format = {
      shift_width = 4,
    },
    lint = {
      enabled = true,
      command = 'mmdc',
    },
    preview = {
      port = 0,
      renderer = 'mermaid.js',
      theme = 'dark',
    },
  }
end
