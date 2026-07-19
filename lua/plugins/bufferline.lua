---@diagnostic disable: different-requires
do
  vim.pack.add { 'https://github.com/akinsho/bufferline.nvim' }
  require('bufferline').setup {
    options = {
      tab_size = 8,
      max_name_length = 16,
      color_icons = true,
      show_buffer_icons = true,
      show_close_icon = false,
      separator_style = 'slant',
      indicator = {
        style = 'underline',
      }
    },
  }
end
