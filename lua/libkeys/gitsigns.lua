---@diagnostic disable: different-requires
do
  local FUNCTION = {}

  FUNCTION.mappings = function(bufnr)
    local gitsigns = require('gitsigns')

    vim.keymap.set('n', '<leader>hs', gitsigns.stage_hunk, {
      buffer = bufnr, desc = '[h]unk [s]tage',
    })
    vim.keymap.set('v', '<leader>hs', function()
      gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v'), })
    end, {
      buffer = bufnr, desc = '[h]unk [s]tage',
    })
    vim.keymap.set('n', '<leader>hb', gitsigns.blame_line, {
      buffer = bufnr, desc = '[h]unk [b]lame line',
    })
    vim.keymap.set('n', '<leader>hB', gitsigns.blame, {
      buffer = bufnr, desc = '[h]unk [B]lame verify',
    })
    vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk, {
      buffer = bufnr, desc = '[h]unk [r]eset',
    })
    vim.keymap.set('v', '<leader>hr', function()
      gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v'), })
    end, {
      buffer = bufnr, desc = '[h]unk [r]eset',
    })
    vim.keymap.set('n', '<leader>hh', gitsigns.preview_hunk, {
      buffer = bufnr, desc = '[h]unk [h]unk preview',
    })
    vim.keymap.set('n', '<leader>hH', gitsigns.diffthis, {
      buffer = bufnr, desc = '[h]unk [H]unk diffthis',
    })
    vim.keymap.set('n', '<leader>hq', gitsigns.setqflist, {
      buffer = bufnr, desc = '[h]unk [q]flist',
    })
    vim.keymap.set('n', '<leader>hQ', function()
      gitsigns.setqflist('all')
    end, {
      buffer = bufnr, desc = '[h]unk [Q]flist all',
    })

    vim.keymap.set('n', '[h', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true,})
      else
        gitsigns.nav_hunk('prev')
      end
    end, {
      buffer = bufnr, desc = 'Previous hunk',
    })
    vim.keymap.set('n', ']h', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true,})
      else
        gitsigns.nav_hunk('next')
      end
    end, {
      buffer = bufnr, desc = 'Next hunk',
    })
  end

  return FUNCTION
end
