do
  vim.pack.add { 'https://github.com/mateconpizza/winbar.nvim' }
  require('winbar').setup {
    enabled = true,
    filename = {
      enabled = true,
      icon = true,
    },
    icons = {
      modified = '●',
      readonly = '☢',
    },
    show_single_buffer = true,
    lsp = {
      clients = {
        enabled = true,
        separator = ','
      },
      diagnostics = {
        enabled = true,
        error = 'e:',
        hint = 'i:',
        info = 'i:',
        warn = 'w:',
      },
      progress = {
        enabled = false,
      },
    },
    git = {
      branch = {
        enabled = false,
      },
      diff = {
        enabled = true,
        added = '₊',
        changed = '₌',
        removed = '₋',
      },
    },
    layout = {
      left = {},
      center = {
        'file_icon',
        'filename',
        'modified',
        'readonly',
        'git_diff',
        'lsp_status',
        'lsp_diagnostics',
      },
      right = {},
    },
  }
end
