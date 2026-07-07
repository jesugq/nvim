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
  require('keymaps.cursorl')

  -- collections
  require('plugins.plenary')
  require('plugins.mini')
  require('plugins.snacks')
  require('keymaps.snacks')

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
  require('configs.lazygit')
  require('plugins.lazygit')
  require('keymaps.lazygit')
  require('plugins.guess-indent')
  require('plugins.nvim-autopairs')
  require('plugins.faster')
  require('plugins.paperplanes')

  -- languages
  require('plugins.orgmode')
  require('autocfg.orgmode')
  require('keymaps.orgmode')
  require('plugins.obsidian')
  require('autocfg.obsidian')
  require('keymaps.obsidian')
end
