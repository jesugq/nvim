do
  local FUNCTION = {}

  local function heading_level(text)
    local marks = text:match('^(#+)%s')
    if marks then
      return #marks
    end
  end

  local function insert_heading(extra_level)
    local line = vim.fn.line('.')
    local total_lines = vim.fn.line('$')

    local level = 1
    for i = line, 1, -1 do
      local found = heading_level(vim.fn.getline(i))
      if found then
        level = found
        break
      end
    end
    level = level + extra_level

    local insert_at = total_lines
    for i = line + 1, total_lines do
      if heading_level(vim.fn.getline(i)) then
        insert_at = i - 1
        break
      end

      if not vim.fn.getline(i):match('%S') then
        local next_content = i + 1
        while next_content <= total_lines and not vim.fn.getline(next_content):match('%S') do
          next_content = next_content + 1
        end

        if next_content <= total_lines then
          insert_at = next_content - 1
          break
        end
      end
    end

    local heading = string.rep('#', level) .. ' '

    if total_lines == 1 and not vim.fn.getline(1):match('%S') then
      vim.fn.setline(1, heading)
      vim.fn.cursor(1, #heading)
      vim.cmd('startinsert!')
      return
    end

    if line == 1 and not vim.fn.getline(1):match('%S') then
      vim.fn.setline(1, heading)
      if total_lines > 1 and vim.fn.getline(2):match('%S') then
        vim.fn.append(1, '')
      end
      vim.fn.cursor(1, #heading)
      vim.cmd('startinsert!')
      return
    end

    vim.fn.append(insert_at, heading)
    line = insert_at + 1
    total_lines = total_lines + 1

    if line < total_lines then
      local line_below = vim.fn.getline(line + 1)
      if line_below:match('%S') then
        vim.fn.append(line, '')
      end
    end

    if line > 1 then
      local line_above = vim.fn.getline(line - 1)
      if line_above:match('%S') then
        vim.fn.append(line - 1, '')
        line = line + 1
      end
    end

    vim.fn.cursor(line, #heading)
    vim.cmd('startinsert!')
  end

  FUNCTION.new_parent = function()
    insert_heading(0)
  end

  FUNCTION.new_child = function()
    insert_heading(1)
  end

  return FUNCTION
end
