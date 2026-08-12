---@diagnostic disable: different-requires
do
  -- settings
  require('configs.startup')
  require('keymaps.editors')
  require('autocfg.editors')
  require('keymaps.buffers')
  require('keymaps.windows')

  -- packs ordered
  require('plugins.nvim-web-devicons')
  require('plugins.plenary')
  require('plugins.mini')
  require('plugins.snacks')
  require('keymaps.snacks')

  -- lsp ordered
  require('plugins.mason')
  require('plugins.nvim-lspconfig')
  require('keymaps.nvim-lspconfig')
  require('plugins.mason-lspconfig')
  require('plugins.mason-tool-installer')
  require('lspconf.lua-ls')
  require('lspconf.yaml-composite')
  require('lspconf.perl-disable')
  require('configs.diagnostics')

  -- ts ordered
  require('plugins.treesitter-parser-registry')
  require('plugins.nvim-treesitter')
  require('autocfg.nvim-treesitter')

  -- cmp ordered
  require('plugins.cmp-buffer')
  require('plugins.cmp-cmdline')
  require('plugins.nvim-cmp')
  require('plugins.cmp-nvim-lsp')

  -- languages
  require('plugins.orgmode')
  require('keymaps.orgmode')
  require('autocfg.orgmode')
  require('plugins.telescope-orgmode')
  require('keymaps.telescope-orgmode')
  require('plugins.obsidian')
  require('autocfg.obsidian')
  require('keymaps.obsidian')

  -- editing
  require('plugins.marks')
  require('plugins.nvim-autopairs')
  require('plugins.auto-session')
  require('keymaps.auto-session')

  -- interface
  require('plugins.github-nvim-theme')
  require('plugins.bufferline')
  require('keymaps.bufferline')
  require('plugins.winbar')
  require('plugins.lualine')
  require('plugins.gitsigns')
  require('plugins.zen-mode')
  require('keymaps.zen-mode')

  -- animation
  require('plugins.dashboard')
  require('autocfg.dashboard')
  require('plugins.smear-cursor')
  require('plugins.tiny-glimmer')
  require('plugins.cellular-automaton')
  require('configs.cellular-automaton')
  require('keymaps.cellular-automaton')

  -- integration
  require('plugins.nvim-tmux-navigation')
  require('keymaps.nvim-tmux-navigation')
  require('plugins.whichkey')
  require('plugins.faster')
  require('plugins.paperplanes')
end

