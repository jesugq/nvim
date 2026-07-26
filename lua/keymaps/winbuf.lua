do
  local winbuf = require('winbuf')
  vim.keymap.set('n', '[b', function() winbuf.cycle(-1) end, { desc = 'Prev buffer' }) vim.keymap.set('n', ']b', function() winbuf.cycle(1) end, { desc = 'Next buffer' })
  vim.keymap.set('n', '<leader>bh', function() winbuf.move_buf('h') end, { desc = 'Move buffer left' })
  vim.keymap.set('n', '<leader>bj', function() winbuf.move_buf('j') end, { desc = 'Move buffer down' })
  vim.keymap.set('n', '<leader>bk', function() winbuf.move_buf('k') end, { desc = 'Move buffer up' })
  vim.keymap.set('n', '<leader>bl', function() winbuf.move_buf('l') end, { desc = 'Move buffer right' })
  vim.keymap.set('n', '<leader>br', function() winbuf.refresh() end, { desc = 'Buffer refresh' })

  local function count_real_buffers()
    local bufs = vim.w.winbuf_bufs or {}
    return #bufs
  end

  _G.count_real_windows = function()
    local wins = vim.api.nvim_tabpage_list_wins(0)
    return #vim.tbl_filter(function(win)
      return vim.api.nvim_win_get_config(win).relative == ''
    end, wins)
  end

  vim.keymap.set('n', '<leader>bx', function()
    local buffer_count = count_real_buffers()
    if buffer_count >= 2 then
      winbuf.close_buf()
    end
  end, { desc = 'Buffer close' })

  vim.keymap.set('n', '<C-w>x', function()
    local window_count = count_real_windows()
    if window_count >= 2 then
      winbuf.close_split()
    end
  end, { desc = 'Window close' })
end
