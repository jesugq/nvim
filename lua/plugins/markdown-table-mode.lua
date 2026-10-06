do
  vim.pack.add { 'https://github.com/Kicamon/markdown-table-mode.nvim' }
  require('markdown-table-mode').setup {
    filetype = {
      '*.md',
    },
    options = {
      insert = true,
      insert_leave = true,
      pad_separator_line = true,
      alig_style = 'default',
    },
  }
  vim.cmd('Mtm')
end
