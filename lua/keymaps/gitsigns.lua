local METHOD = {}

METHOD.mappings = function(bufnr)
  local gitsigns = require('gitsigns')

  vim.keymap.set('n', '<leader>ho', gitsigns.preview_hunk, {
    buffer = bufnr, desc = 'Hunk preview open'
  })
  vim.keymap.set('n', '<leader>hi', gitsigns.preview_hunk_inline, {
    buffer = bufnr, desc = 'Hunk preview inline'
  })
  vim.keymap.set('n', '<leader>hb', gitsigns.blame_line, {
    buffer = bufnr, desc = 'Hunk blame line'
  })
  vim.keymap.set('n', '<leader>hd', gitsigns.diffthis, {
    buffer = bufnr, desc = 'Hunk diff this'
  })
  vim.keymap.set('n', '<leader>hD', function() gitsigns.diffthis('~') end, {
    buffer = bufnr, desc = 'Hunk diff this'
  })
end

return METHOD
