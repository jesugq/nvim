---@diagnostic disable: different-requires
do
  local FUNCTION = {}

  FUNCTION.mappings = function(bufnr)
    local gitsigns = require('gitsigns')

    vim.keymap.set('n', '<leader>hh', gitsigns.preview_hunk, {
      buffer = bufnr, desc = 'Hunk preview'
    })
    vim.keymap.set('n', '<leader>hH', gitsigns.diffthis, {
      buffer = bufnr, desc = 'Hunk diffthis'
    })
    vim.keymap.set('n', '<leader>ha', gitsigns.stage_hunk, {
      buffer = bufnr, desc = 'Hunk stage hunk'
    })
    vim.keymap.set('n', '<leader>hd', gitsigns.reset_hunk, {
      buffer = bufnr, desc = 'Hunk reset hunk'
    })
    vim.keymap.set('v', '<leader>ha', function()
      gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, {
      buffer = bufnr, desc = 'Hunk stage hunk'
    })
    vim.keymap.set('v', '<leader>hd', function()
      gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, {
      buffer = bufnr, desc = 'Hunk reset hunk'
    })
    vim.keymap.set('n', '<leader>hb', gitsigns.blame_line, {
      buffer = bufnr, desc = 'Hunk blame line'
    })
    vim.keymap.set('n', '<leader>hB', gitsigns.blame, {
      buffer = bufnr, desc = 'Hunk blame verify'
    })

    vim.keymap.set('n', '<leader>bh', gitsigns.setqflist, {
      buffer = bufnr, desc = 'Buffer hunk list'
    })
    vim.keymap.set('n', '<leader>bH', function()
      gitsigns.setqflist('all')
    end, {
      buffer = bufnr, desc = 'Buffer hunk list'
    })

    vim.keymap.set('n', '[h', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end, {
      buffer = bufnr, desc = 'Hunk blame verify'
    })
    vim.keymap.set('n', ']h', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end, {
      buffer = bufnr, desc = 'Hunk blame verify'
    })
  end

  return FUNCTION
end
