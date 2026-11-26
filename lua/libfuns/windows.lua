do
  local FUNCTION = {}

  local opposites = { h = 'l', l = 'h', k = 'j', j = 'k', }

  FUNCTION.swap_window = function(direction)
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

  FUNCTION.last_window = function()
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

  return FUNCTION
end
