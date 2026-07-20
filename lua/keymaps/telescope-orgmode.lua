do
  local tom = require('telescope-orgmode')

  vim.keymap.set('n', '<C-c>r', tom.refile_heading, { desc = 'Org refile' })
  vim.keymap.set('n', '<C-c>h', tom.insert_link, { desc = 'Org insert link to headline' })
end
