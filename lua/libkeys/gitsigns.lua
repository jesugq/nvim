---@diagnostic disable: different-requires
do
  local FUNCTION = {}

  FUNCTION.mappings = function(bufnr)
    local gitsigns = require('gitsigns')

    vim.keymap.set('n', '<leader>ha', gitsigns.stage_hunk, {
      buffer = bufnr, desc = '[h]unk [a]dd',
    })
    vim.keymap.set('v', '<leader>ha', function()
      gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v'), })
    end, {
      buffer = bufnr, desc = '[h]unk [a]dd',
    })
    vim.keymap.set('n', '<leader>hb', gitsigns.blame_line, {
      buffer = bufnr, desc = '[h]unk [b]lame line',
    })
    vim.keymap.set('n', '<leader>hB', gitsigns.blame, {
      buffer = bufnr, desc = '[h]unk [b]lame verify',
    })
    vim.keymap.set('n', '<leader>hd', gitsigns.reset_hunk, {
      buffer = bufnr, desc = '[h]unk [d]elete',
    })
    vim.keymap.set('v', '<leader>hd', function()
      gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v'), })
    end, {
      buffer = bufnr, desc = '[h]unk [d]elete',
    })
    vim.keymap.set('n', '<leader>hh', gitsigns.preview_hunk, {
      buffer = bufnr, desc = '[h]unk [h]unk preview',
    })
    vim.keymap.set('n', '<leader>hH', gitsigns.diffthis, {
      buffer = bufnr, desc = '[h]unk [h]unk diffthis',
    })
    vim.keymap.set('n', '<leader>hl', gitsigns.setqflist, {
      buffer = bufnr, desc = '[h]unk [l]ist this',
    })
    vim.keymap.set('n', '<leader>hL', function()
      gitsigns.setqflist('all')
    end, {
      buffer = bufnr, desc = '[h]unk [l]ist all',
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
