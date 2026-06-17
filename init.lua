do
  -- startups
  require('configs.startup')

  -- option
  require('configs.options')
  require('keymaps.highlight-esc')
  require('keymaps.file')

  -- indent
  require('configs.indents')

  -- autobuild
  require('configs.autobuild')

  -- highlight
  require('configs.highlight-yank')

  -- ui
  require('plugins.guess-indent')
  require('plugins.gitsigns')
  require('plugins.whichkey')
  require('plugins.tokyonight')
  require('plugins.nvim-autopairs')

  -- collections
  -- require('plugins.plenary')
  -- require('plugins.telescope')
  -- require('keymaps.telescope')
  require('plugins.mini')
  require('plugins.snacks')
  require('keymaps.snacks')

  -- lsp
  require('plugins.fidget')
  require('plugins.mason')
  require('plugins.mason-lspconfig')
  require('plugins.mason-tool-installer')
  require('plugins.arborist')
end
