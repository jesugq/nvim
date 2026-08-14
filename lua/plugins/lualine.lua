do
local function current_date()
  return os.date("%Y-%m-%d")
end

  vim.pack.add { 'https://github.com/nvim-lualine/lualine.nvim' }
  require('lualine').setup {
    options = {
      icons_enabled = true,
      always_divide_middle = true,
      globalstatus = true,
    },
    winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'diagnostics', 'diff' },
      lualine_y = {},
      lualine_z = {},
    },
    inactive_winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'diagnostics', 'diff' },
      lualine_y = {},
      lualine_z = {},
    },
    sections = {
      lualine_a = {},
      lualine_b = { 'mode', 'searchcount', 'selectioncount' },
      lualine_c = { 'branch' },
      lualine_x = { 'lsp_status'},
      lualine_y = { { current_date } },
      lualine_z = {},
    },
  }
end
