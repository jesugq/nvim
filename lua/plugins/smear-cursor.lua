do
  vim.pack.add { 'https://github.com/sphamba/smear-cursor.nvim' }
  require('smear_cursor').setup {
    stiffness = 0.5,
    trailing_stiffness = 0.49,
    never_draw_over_target = false,
    smear_between_neighbor_lines = false,
  }
end
