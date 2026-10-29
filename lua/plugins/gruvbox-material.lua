do
  vim.pack.add { 'https://github.com/sainnhe/gruvbox-material' }
  vim.g.gruvbox_material_background = 'medium'
  vim.g.gruvbox_material_foreground = 'material'
  vim.g.gruvbox_material_enable_italic = 1
  vim.g.gruvbox_material_enable_bold = 1
  vim.g.gruvbox_material_dim_inactive_windows = 1
  vim.g.gruvbox_material_sign_column_background = 'grey'
  vim.g.gruvbox_material_ui_contrast = 'low'
  vim.g.gruvbox_material_current_word = 'underline'
  vim.g.gruvbox_material_statusline_style = 'mix'
  vim.cmd.colorscheme('gruvbox-material')
end
