do
  vim.pack.add { 'https://github.com/folke/tokyonight.nvim' }
  require('tokyonight').setup {
    styles = {
      comments = { italic = false },
    },
    on_highlights = function(highlights, colors)
      highlights.Folded = {
        bg = colors.bg_dark,
        fg = colors.comment,
      }
      highlights.FoldColumn = {
        bg = colors.bg_dark,
        fg = colors.dark3,
      }
    end,
  }
  vim.cmd.colorscheme 'tokyonight-night'
end
