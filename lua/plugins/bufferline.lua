---@diagnostic disable: different-requires
do
  vim.pack.add { 'https://github.com/akinsho/bufferline.nvim' }
  local bufferline = require('bufferline')
  bufferline.setup {
    options = {
      mode = 'buffers',
      style_preset = bufferline.style_preset.default,
      numbers = 'none',
      indicator = {
        icon = '▎',
        style = 'icon',
      },
      left_trunc_marker = ' ',
      right_trunc_marker = ' ',
      truncate_names = false,
      tab_size = 2,
      diagnostics = false,
      color_icons = true,
      show_buffer_icons = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
      show_tab_indicators = false,
      show_duplicate_prefix = false,
      persist_buffer_sort = true,
      separator_style = 'thin',
      always_show_bufferline = true,
    },
  }
end
