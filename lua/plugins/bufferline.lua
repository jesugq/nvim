---@diagnostic disable: different-requires
do
  vim.pack.add { 'https://github.com/akinsho/bufferline.nvim' }
  local bufferline = require('bufferline')
  bufferline.setup {
    options = {
      mode = 'buffers',
      style_preset = bufferline.style_preset.minimal,
      themable = true,
      numbers = 'none',
      indicator = { style = 'underline', },
      left_trunc_marker = ' ',
      right_trunc_marker = ' ',
      truncate_names = false,
      tab_size = 0,
      diagnostics = false,
      color_icons = true,
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      buffer_close_icon = '',
      show_tab_indicators = false,
      show_duplicate_prefix = false,
      persist_buffer_sort = true,
      separator_style = { '', '' },
      always_show_bufferline = true,
    },
    highlights = {
      buffer_selected = {
        bold = true,
        italic = false,
      }
    },
  }
  vim.o.showtabline = 0
end
