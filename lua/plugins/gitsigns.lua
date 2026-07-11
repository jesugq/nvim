do
  vim.pack.add { 'https://github.com/lewis6991/gitsigns.nvim' }
  require('gitsigns').setup {
    signcolumn = true,
    numhl = true,
    signs = {
      add          = { text = '┃' },
      change       = { text = '┃' },
      delete       = { text = '_' },
      topdelete    = { text = '‾' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },
    signs_staged = {
      add          = { text = '┃' },
      change       = { text = '┃' },
      delete       = { text = '_' },
      topdelete    = { text = '‾' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },
    signs_staged_enable = true,
    current_line_blame = true,
    on_attach = function(bufnr)
      require('keymaps/gitsigns').mappings(bufnr)
    end
  }
end
