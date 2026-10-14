do
  local opposites = { h = 'l', l = 'h', k = 'j', j = 'k', }

  local function swap_window(direction)
    local source_win = vim.api.nvim_get_current_win()
    vim.cmd('wincmd ' .. direction)
    local target_win = vim.api.nvim_get_current_win()

    if source_win == target_win and opposites[direction] then
      while true do
        local current = vim.api.nvim_get_current_win()
        vim.cmd('wincmd ' .. opposites[direction])
        if vim.api.nvim_get_current_win() == current then
          break
        end
      end
      target_win = vim.api.nvim_get_current_win()
    end

    if source_win ~= target_win then
      local source_buf = vim.api.nvim_win_get_buf(source_win)
      local target_buf = vim.api.nvim_win_get_buf(target_win)

      vim.api.nvim_win_set_buf(source_win, target_buf)
      vim.api.nvim_win_set_buf(target_win, source_buf)
    end
  end

  local function last_window()
    local current = vim.api.nvim_get_current_win()
    local previous = vim.fn.win_getid(vim.fn.winnr('#'))
    local same_tab = previous ~= 0
        and vim.api.nvim_win_is_valid(previous)
        and vim.api.nvim_win_get_tabpage(previous) == vim.api.nvim_get_current_tabpage()

    if same_tab and previous ~= current then
      vim.api.nvim_set_current_win(previous)
    else
      vim.cmd('wincmd w')
    end
  end

  -- <leader>w
  vim.keymap.set('n', '<leader>ww', last_window, { desc = 'Last window' })
  vim.keymap.set('n', '<leader>wh', '<Cmd>wincmd h<CR>', { desc = 'Go to window left' })
  vim.keymap.set('n', '<leader>wj', '<Cmd>wincmd j<CR>', { desc = 'Go to window below' })
  vim.keymap.set('n', '<leader>wk', '<Cmd>wincmd k<CR>', { desc = 'Go to window above' })
  vim.keymap.set('n', '<leader>wl', '<Cmd>wincmd l<CR>', { desc = 'Go to window right' })
  vim.keymap.set('n', '<leader>wH', function() swap_window('h') end, { desc = 'Swap window left' })
  vim.keymap.set('n', '<leader>wJ', function() swap_window('j') end, { desc = 'Swap window down' })
  vim.keymap.set('n', '<leader>wK', function() swap_window('k') end, { desc = 'Swap window up' })
  vim.keymap.set('n', '<leader>wL', function() swap_window('l') end, { desc = 'Swap window right' })
  vim.keymap.set('n', '<leader>wz', '<Cmd>close<CR>', { desc = 'Close current window' })
  vim.keymap.set('n', '<leader>wc', '<Cmd>new<CR>', { desc = 'Split horizontally with new buffer' })
  vim.keymap.set('n', '<leader>wv', '<Cmd>vnew<CR>', { desc = 'Split vertically with new buffer' })
end
