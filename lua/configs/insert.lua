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

    vim.cmd("normal! I## ")

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

  FUNCTION.new_dashed = function()
    local line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")

    vim.cmd("normal! I----")

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

  -- FUNCTION.new_hash = function(tag)
  --   vim.cmd('stopinsert')
  --
  --   local line = vim.api.nvim_get_current_line()
  --
  --   if #line > 0 and line:sub(-1) ~= ' ' then
  --     if tag then
  --       line = line .. ' #' .. tag
  --     else
  --       line = line .. ' #'
  --     end
  --     vim.api.nvim_set_current_line(line)
  --   end
  --
  --   local row = vim.api.nvim_win_get_cursor(0)[1]
  --   vim.api.nvim_win_set_cursor(0, { row, math.max(0, #line - 1) })
  --
  --   if not tag then
  --     vim.cmd('startinsert!')
  --   end
  -- end
  FUNCTION.new_hash = function(tag)
    local line = vim.api.nvim_get_current_line()

    if tag and tag ~= '' then
      local escaped_tag = tag:gsub("[%^%$%(%)%%%.%[%]%*%+%-%?]", "%%%1")
      if line:find(" #" .. escaped_tag) then
        return
      end
    end

    vim.cmd('stopinsert')

    if #line > 0 and line:sub(-1) ~= ' ' then
      if tag then
        line = line .. ' #' .. tag
      else
        line = line .. ' #'
      end
      vim.api.nvim_set_current_line(line)
    end

    local row = vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_win_set_cursor(0, { row, math.max(0, #line - 1) })

    if not tag then
      vim.cmd('startinsert!')
    end
  end

  FUNCTION.bye_hash = function(tag)
      if not tag then
        return
      end

      vim.cmd('stopinsert')

      local line = vim.api.nvim_get_current_line()
      local escaped_tag = tag:gsub("[%^%$%(%)%%%.%[%]%*%+%-%?]", "%%%1")
      local new_line = line:gsub(" #" .. escaped_tag, "")

      if new_line ~= line then
        vim.api.nvim_set_current_line(new_line)
      end

      local row = vim.api.nvim_win_get_cursor(0)[1]
      vim.api.nvim_win_set_cursor(0, { row, math.max(0, #new_line - 1) })
    end

  return FUNCTION
end
