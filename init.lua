do
  -- startup
  require('configs.startup')
  require('configs.indents')
  require('autocfg.indents')
  require('configs.autobuild')
  require('autocfg.autobuild')
  require('autocfg.autochecktime')
  require('autocfg.highlightyank')

  -- keymaps
  require('keymaps.editing')
  require('keymaps.session')
  require('keymaps.buffers')

  -- interface
  require('plugins.fidget')
  require('plugins.gitsigns')
  require('plugins.whichkey')
  require('plugins.tokyonight')
  require('plugins.no-neck-pain')
  require('keymaps.no-neck-pain')
  require('plugins.smear-cursor')

  -- tuning
  require('plugins.marks')
  require('keymaps.marks')
  require('plugins.plenary')
  require('plugins.guess-indent')
  require('plugins.nvim-autopairs')
  require('plugins.faster')

  -- languages
  require('plugins.orgmode')
  require('keymaps.orgmode')

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
