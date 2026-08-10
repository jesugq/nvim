do
  local FUNCTION = {}

  FUNCTION.new_parent = function()
    vim.cmd('stopinsert')

    local current_line = vim.api.nvim_win_get_cursor(0)[1]
    local line_content = vim.api.nvim_buf_get_lines(0, current_line - 1, current_line, false)[1]

    if line_content and line_content:match('^%s*$') == nil then
      vim.cmd('normal! o')
    end
    vim.cmd('normal! o')

    vim.api.nvim_put({ '# ' }, 'c', false, true)

    vim.cmd('startinsert!')
  end

  FUNCTION.new_child = function()
    vim.cmd('stopinsert')

    local current_line = vim.api.nvim_win_get_cursor(0)[1]
    local line_content = vim.api.nvim_buf_get_lines(0, current_line - 1, current_line, false)[1]

    if line_content and line_content:match('^%s*$') == nil then
      vim.cmd('normal! o')
    end
    vim.cmd('normal! o')

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

  return FUNCTION
end
