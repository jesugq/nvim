do
  local FUNCTION = {}

  FUNCTION.mappings = function(bufnr)
    local gitsigns = require('gitsigns')

    vim.keymap.set('n', '<leader>hh', gitsigns.preview_hunk, {
      buffer = bufnr, desc = 'Hunk preview'
    })
    vim.keymap.set('n', '<leader>hd', gitsigns.reset_hunk, {
      buffer = bufnr, desc = 'Hunk reset hunk'
    })
    vim.keymap.set('n', '<leader>hb', gitsigns.blame_line, {
      buffer = bufnr, desc = 'Hunk blame line'
    })
    vim.keymap.set('n', '<leader>hv', gitsigns.blame, {
      buffer = bufnr, desc = 'Hunk blame verify'
    })
  end

  return FUNCTION
end
