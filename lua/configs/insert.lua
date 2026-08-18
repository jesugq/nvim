do
  local FUNCTION = {}

  FUNCTION.new_parent = function()
    local line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")

    vim.cmd("normal! I# ")

    if line < total_lines then
      local line_below = vim.fn.getline(line + 1)
      if line_below:match("%S") then
        vim.fn.append(line, "")
      end
    end

    if line > 1 then
      local line_above = vim.fn.getline(line - 1)
      if line_above:match("%S") then
        vim.fn.append(line - 1, "")
      end
    end

    vim.cmd('startinsert!')
  end

  FUNCTION.new_child = function()
    local line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")

    if line < total_lines then
      local line_below = vim.fn.getline(line + 1)
      if line_below:match("%S") then
        vim.fn.append(line, "")
      end
    end

    if line > 1 then
      local line_above = vim.fn.getline(line - 1)
      if line_above:match("%S") then
        vim.fn.append(line - 1, "")
      end
    end

    vim.cmd('startinsert!')
  end

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

  FUNCTION.new_hash = function()
    vim.cmd('stopinsert')

    local line = vim.api.nvim_get_current_line()

    if #line > 0 and line:sub(-1) ~= ' ' then
      line = line .. ' #'
      vim.api.nvim_set_current_line(line)
    end

    local row = vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_win_set_cursor(0, { row, math.max(0, #line - 1) })

    vim.cmd('startinsert!')
  end

  return FUNCTION
end
