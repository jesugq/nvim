do
  local FUNCTION = {}

  FUNCTION.new_space = function()
    vim.cmd('stopinsert')

    local line = vim.api.nvim_get_current_line()

    if #line > 0 and line:sub(-1) ~= ' ' then
      line = line .. ' '
      vim.api.nvim_set_current_line(line)
    end

    local row = vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_win_set_cursor(0, { row, math.max(0, #line - 1) })

    vim.cmd('startinsert!')
  end

  return FUNCTION
end
