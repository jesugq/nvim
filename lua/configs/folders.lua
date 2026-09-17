do
  local FUNCTION = {}

  FUNCTION.random_file = function(path, prev_replace)

    local full_path = vim.fn.expand(path)
    local files = {}
    for name, type in vim.fs.dir(full_path) do
      if type == 'file' then
        table.insert(files, vim.fs.joinpath(full_path, name))
      end
    end

    if #files == 0 then
      return
    end

    math.randomseed((vim.uv or vim.loop).hrtime())
    local file = files[math.random(#files)]

    local prev_buffer = vim.api.nvim_get_current_buf()
    local prev_name = vim.api.nvim_buf_get_name(prev_buffer)
    vim.cmd('edit ' .. vim.fn.fnameescape(file))
    local next_buffer = vim.api.nvim_get_current_buf()
    local next_name = vim.api.nvim_buf_get_name(next_buffer)

    local prev_valid = vim.api.nvim_buf_is_valid(prev_buffer)
    local prev_unique = prev_buffer ~= next_buffer
    local prev_sibling = vim.fs.dirname(prev_name) == vim.fs.dirname(next_name)

    if prev_replace and prev_valid and prev_unique and prev_sibling then
      pcall(Snacks.bufdelete.delete, { buf = prev_buffer, })
    end
  end

  local function find_named(stem)
    local found = vim.fs.find(function(name)
      return name == stem or vim.startswith(name, stem .. '.')
    end, { path = vim.uv.cwd(), limit = 1, type = 'file' })

    if found[1] then
      return vim.fs.normalize(found[1])
    end
  end

  local function warn_named(stems, current_index)
    local names = {}
    for index, stem in ipairs(stems) do
      names[index] = (index == current_index and '* ' or '  ') .. stem
    end
    vim.notify(table.concat(names, '\n'), vim.log.levels.INFO, {
      id = 'named-files',
      title = 'Named files',
    })
  end

  FUNCTION.open_named = function(stems, reverse)
    local files = {}
    for _, stem in ipairs(stems) do
      local file = find_named(stem)
      if not file then
        return
      end
      table.insert(files, file)
    end

    local current = vim.api.nvim_get_current_buf()
    local current_name = vim.fs.normalize(vim.api.nvim_buf_get_name(current))
    local current_index
    for index, file in ipairs(files) do
      if file == current_name then
        current_index = index
        break
      end
    end

    if current_index then
      local direction = reverse and -1 or 1
      local next_index = (current_index - 1 + direction) % #files + 1
      local next_file = files[next_index]
      vim.cmd.edit(vim.fn.fnameescape(next_file))
      pcall(Snacks.bufdelete.delete, { buf = current })
      warn_named(stems, next_index)
      return
    end

    for index, file in ipairs(files) do
      local buffer = vim.fn.bufnr(file)
      if buffer > 0 and vim.api.nvim_buf_is_valid(buffer) then
        vim.cmd.edit(vim.fn.fnameescape(file))
        warn_named(stems, index)
        return
      end
    end

    vim.cmd.edit(vim.fn.fnameescape(files[1]))
    warn_named(stems, 1)
  end

  return FUNCTION
end
