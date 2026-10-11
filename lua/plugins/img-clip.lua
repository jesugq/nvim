do
  vim.pack.add { 'https://github.com/hakonharnes/img-clip.nvim' }
  local img_clip = require('img-clip')
  img_clip.setup {
    default = {
      dir_path = 'attachment',
      relative_to_current_file = false,
      relative_template_path = false,
      prompt_for_file_name = false,
      file_name = "%Y-%m-%d-",
    },
    filetypes = {
      markdown = {
        template = '![$CURSOR]($FILE_PATH)',
      },
      org = {
        template = '[[file:$FILE_PATH][$CURSOR]]',
      },
    },
  }
end
