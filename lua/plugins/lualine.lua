do
  vim.pack.add { 'https://github.com/nvim-lualine/lualine.nvim' }
  require('lualine').setup {
    options = {
      icons_enabled = true,
      always_divide_middle = true,
    },
    sections = {
      lualine_a = {},
      lualine_b = { 'mode' },
      lualine_c = { 'branch' },
      lualine_x = { 'progress' },
      lualine_y = { 'location' },
      lualine_z = {},
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = { 'mode' },
      lualine_c = { 'branch' },
      lualine_x = { 'progress' },
      lualine_y = { 'location' },
      lualine_z = {},
    }
  }
end
