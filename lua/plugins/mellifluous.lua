do
  local mellifluous = require('libfuns.mellifluous')

  vim.pack.add { 'https://github.com/ramojus/mellifluous.nvim' }
  require('mellifluous').setup {
    colorset = 'tender',
    highlight_overrides = {
      dark = mellifluous.snacks_highlights,
      light = mellifluous.snacks_highlights,
    },
  }
  vim.cmd.colorscheme 'mellifluous'
end
