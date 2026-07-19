do
  -- startup
  require('configs.startup')
  require('configs.autobuild')
  require('autocfg.autobuild')
  require('autocfg.autochecktime')
  require('autocfg.highlightyank')

  -- keymaps
  require('keymaps.editing')
  require('keymaps.session')
  require('keymaps.buffers')
  require('keymaps.windows')

  -- collections
  require('plugins.plenary')
  require('plugins.mini')
  require('plugins.snacks')
  require('keymaps.snacks')

  -- lsp ordered
  require('plugins.mason')
  require('plugins.nvim-lspconfig')
  require('plugins.mason-lspconfig')
  require('plugins.mason-tool-installer')
  require('lspconf.lua-ls')

  -- ts ordered
  require('plugins.treesitter-parser-registry')
  require('plugins.nvim-treesitter')
  require('autocfg.nvim-treesitter')

  -- cmp ordered
  require('plugins.nvim-cmp')
  require('plugins.cmp-nvim-lsp')

  -- lsp & ts helpers
  require('plugins.fidget')
  require('configs.diagnostics')

  -- interface
  require('plugins.github-nvim-theme')
  require('plugins.bufferline')
  require('keymaps.bufferline')
  require('plugins.lualine')
  require('plugins.gitsigns')
  require('plugins.whichkey')
  require('plugins.no-neck-pain')
  require('plugins.smear-cursor')
  require('plugins.cellular-automaton')
  require('keymaps.cellular-automaton')

  -- tuning
  require('plugins.marks')
  require('keymaps.marks')
  require('plugins.nvim-autopairs')
  require('plugins.faster')
  require('plugins.paperplanes')

  -- languages
  require('plugins.orgmode')
  require('keymaps.orgmode')
  require('plugins.obsidian')
  require('autocfg.obsidian')
  require('keymaps.obsidian')
end
