do
  vim.pack.add { 'https://github.com/hrsh7th/nvim-cmp' }
  local cmp = require('cmp')
  local cmp_keys = require('libkeys.nvim-cmp')

  cmp.setup {
    snippet = {
      expand = function(args)
        vim.snippet.expand(args.body)
      end,
    },
    preselect = cmp.PreselectMode.None,
    mapping = cmp.mapping.preset.insert(
      cmp_keys.mappings(cmp)
    ),
    sources = cmp.config.sources({
      { name = 'nvim_lsp', },
    }, {
      { name = 'buffer', },
    }),
  }

  cmp.setup.cmdline({ '/', '?', }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer', },
    },
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path', },
    }, {
      { name = 'cmdline', },
    }),
    matching = { disallow_symbol_nonprefix_matching = false, },
  })
end
