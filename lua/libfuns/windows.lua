do
  local FUNCTION = {}

  local opposites = { h = 'l', l = 'h', k = 'j', j = 'k', }

  FUNCTION.visible_buffers = function()
    local seen, buffers = {}, {}
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
      local buf = vim.api.nvim_win_get_buf(win)
      if not seen[buf] then
        seen[buf] = true
        buffers[#buffers + 1] = buf
      end
    end
    return buffers
  end

  FUNCTION.window_switch = function()
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
      pcall(vim.api.nvim_win_call, win, function() vim.cmd('buffer #') end)
    end
  end

  FUNCTION.window_delete = function()
    local buffers = FUNCTION.visible_buffers()
    local names = vim.tbl_map(function(buf)
      local name = vim.api.nvim_buf_get_name(buf)
      return name ~= '' and vim.fn.fnamemodify(name, ':t') or '[No Name]'
    end, buffers)
    local choice = vim.fn.confirm('Delete visible buffers?\n' .. table.concat(names, '\n'), '&Yes\n&No', 2)
    if choice == 1 then
      for _, buf in ipairs(buffers) do
        if vim.api.nvim_buf_is_valid(buf) then
          pcall(vim.api.nvim_buf_delete, buf, { force = true })
        end
      end
    end
  end

  FUNCTION.window_save = function()
    for _, buf in ipairs(FUNCTION.visible_buffers()) do
      if vim.api.nvim_buf_is_valid(buf) then
        pcall(vim.api.nvim_buf_call, buf, function() vim.cmd('silent write') end)
      end
    end
  end

  FUNCTION.window_checktime = function()
    for _, buf in ipairs(FUNCTION.visible_buffers()) do
      if vim.api.nvim_buf_is_valid(buf) then
        vim.api.nvim_buf_call(buf, function() vim.cmd('checktime') end)
      end
    end
  end

  FUNCTION.window_recover = function()
    for _, buf in ipairs(FUNCTION.visible_buffers()) do
      if vim.api.nvim_buf_is_valid(buf) then
        pcall(vim.api.nvim_buf_call, buf, function() vim.cmd('recover') end)
      end
    end
  end

  FUNCTION.window_wrap = function()
    local new_state = not vim.wo.wrap
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
      vim.api.nvim_set_option_value('wrap', new_state, { win = win })
      vim.api.nvim_set_option_value('linebreak', new_state, { win = win })
    end
  end

  FUNCTION.window_number = function()
    local new_state = not vim.wo.relativenumber
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
      vim.api.nvim_set_option_value('relativenumber', new_state, { win = win })
    end
  end

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
