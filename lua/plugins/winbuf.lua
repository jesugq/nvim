do
  vim.pack.add { 'https://github.com/e-sigs/winbuf.nvim' }
  local winbuf = require('winbuf')
  winbuf.setup {
    style = 'slant',
    indicator = { style = 'bar', },
    icons = { enabled = true, },
    hide_single = false,
    show_close_icon = false,
    show_buffer_ordinal = true,
    diagnostics = 'nvim_lsp',
    buf_delete = nil,
  }
end
