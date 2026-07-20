do
  vim.pack.add { 'https://github.com/nvim-orgmode/telescope-orgmode.nvim' }
  require('telescope-orgmode').setup {
    adapter = 'snacks',
    ordinal_fields = { 'location', 'headline', },
    show_tags = false,
    show_todo_state = false,
    show_priority = false,
  }
end
