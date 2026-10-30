---@diagnostic disable: different-requires
do
  vim.pack.add { 'https://github.com/lewis6991/gitsigns.nvim' }
  local gitsigns = require('gitsigns')
  local gitsigns_keys = require('libkeys.gitsigns')
  gitsigns.setup {
    signcolumn = true,
    numhl = true,
    signs = {
      add          = { text = '₊', },
      change       = { text = '₌', },
      delete       = { text = '₋', },
      topdelete    = { text = '⁻', },
      changedelete = { text = '⁼', },
      untracked    = { text = 'ᵤ', },
    },
    current_line_blame = true,
    on_attach = function(bufnr)
      gitsigns_keys.mappings(bufnr)
    end,
  }
end
