do
  local function current_date()
    return os.date('%Y-%m-%d')
  end

  vim.pack.add { 'https://github.com/nvim-lualine/lualine.nvim' }
  local theme = require('libfuns.lualine').section_theme()

  require('lualine').setup {
    options = {
      icons_enabled = true,
      always_divide_middle = true,
      globalstatus = true,
      theme = theme,
    },
    winbar = {
      lualine_a = { 'filename', },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'diff', 'diagnostics', },
    },
    inactive_winbar = {
      lualine_a = { 'filename', },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'diff', 'diagnostics', },
    },
    sections = {
      lualine_a = { 'mode', 'searchcount', 'selectioncount', },
      lualine_b = { 'branch', },
      lualine_c = {},
      lualine_x = {},
      lualine_y = { 'lsp_status', },
      lualine_z = { { current_date, }, },
    },
  }
end
