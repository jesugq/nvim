do
  -- startups
  require('configs.startup')

  -- option
  require('configs.options')

  -- keymaps
  require('keymaps.highlight-esc')
  require('keymaps.editing')
  require('keymaps.session')
  require('keymaps.buffers')

  -- indent
  require('configs.indents')

  -- autobuild
  require('configs.autobuild')

  -- highlight
  require('configs.highlight-yank')

  -- ux
  require('plugins.guess-indent')
  require('plugins.gitsigns')
  require('plugins.whichkey')
  require('plugins.tokyonight')
  require('plugins.nvim-autopairs')
  require('plugins.orgmode')
  require('keymaps.orgmode')
  require('plugins.no-neck-pain')
  require('keymaps.no-neck-pain')

  -- collections
  require('plugins.mini')
  require('plugins.snacks')
  require('keymaps.snacks')

  -- lsp
  -- require('plugins.fidget')
  -- require('plugins.mason')
  -- require('plugins.mason-lspconfig')
  -- require('plugins.mason-tool-installer')
  -- require('plugins.arborist')
end
