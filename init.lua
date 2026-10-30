---@diagnostic disable: different-requires
do
  -- settings
  require('configs.startup')
  require('configs.warning')
  require('autocfg.focused')
  require('keymaps.buffers')
  require('keymaps.windows')
  require('keymaps.context')
  require('keymaps.breaker')
  require('keymaps.reading')

  -- packs ordered
  require('plugins.nvim-web-devicons')
  require('plugins.plenary')
  require('plugins.mini')
  require('plugins.snacks')
  require('keymaps.snacks')

  -- lsp ordered
  require('plugins.mason')
  require('plugins.nvim-lspconfig')
  require('autocfg.nvim-lspconfig')
  require('plugins.mason-lspconfig')
  require('plugins.mason-tool-installer')
  require('lspconf.lua-ls')
  require('lspconf.yaml-composite')

  -- ts ordered
  require('plugins.treesitter-parser-registry')
  require('plugins.nvim-treesitter')
  require('autocfg.nvim-treesitter')

  -- cmp ordered
  require('plugins.cmp-buffer')
  require('plugins.cmp-cmdline')
  require('plugins.nvim-cmp')
  require('plugins.cmp-nvim-lsp')

  -- editing
  require('plugins.marks')
  require('plugins.nvim-recorder')
  require('plugins.auto-session')
  require('keymaps.auto-session')

  -- languages
  require('autocfg.markdown')

  -- interface
  require('plugins.gruvbox-material')
  require('plugins.lualine')
  require('plugins.gitsigns')
  require('plugins.zen-mode')
  require('autocfg.zen-mode')
  require('keymaps.zen-mode')

  -- animation
  require('plugins.dashboard')
  require('autocfg.dashboard')
  require('keymaps.dashboard')
  require('plugins.tiny-glimmer')

  -- integration
  require('plugins.which-key')
  require('keymaps.which-key')
  require('plugins.faster')
  require('plugins.paperplanes')
  require('keymaps.paperplanes')
end
