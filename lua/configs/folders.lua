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

  local function atsign_find()
    local files = {}
    local root = vim.uv.cwd()
    for name, type in vim.fs.dir(root) do
      if type == 'file' and vim.startswith(name, '@') then
        table.insert(files, vim.fs.normalize(vim.fs.joinpath(root, name)))
      end
    end

    table.sort(files)
    return files
  end

  local function atsign_warn(files, current_index, blocked_index)
    local names = {}
    for index, file in ipairs(files) do
      local marker = index == blocked_index and '×' or index == current_index and '*' or ' '
      names[index] = marker .. ' '
        .. vim.fs.basename(file):gsub('%.[^.]+$', '')
    end
    vim.notify(table.concat(names, '\n'), vim.log.levels.INFO, { id = 'atsign-file', title = 'Atsign File', })
  end

  local function atsign_unsaved(files, active_buffer)
    for index, file in ipairs(files) do
      local buffer = vim.fn.bufnr(file)
      if buffer > 0 and buffer ~= active_buffer and vim.api.nvim_buf_is_valid(buffer) and vim.bo[buffer].modified then
        return index
      end
    end
  end

  local function atsign_kill(files, active_buffer)
    for _, file in ipairs(files) do
      local buffer = vim.fn.bufnr(file)
      if buffer > 0 and buffer ~= active_buffer and vim.api.nvim_buf_is_valid(buffer) then
        pcall(Snacks.bufdelete.delete, { buf = buffer })
      end
    end
  end

  FUNCTION.atsign_file = function(reverse)
    local files = atsign_find()
    if #files == 0 then
      return
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

    local next_index
    if current_index then
      local direction = reverse and -1 or 1
      next_index = (current_index - 1 + direction) % #files + 1
    else
      next_index = reverse and #files or 1
    end

    local next_file = files[next_index]
    local next_buffer = vim.fn.bufnr(next_file)
    local unsaved_index = atsign_unsaved(files, next_buffer)
    if unsaved_index then
      atsign_warn(files, current_index, unsaved_index)
      return
    end

    vim.cmd.edit(vim.fn.fnameescape(next_file))
    atsign_kill(files, vim.api.nvim_get_current_buf())
    atsign_warn(files, next_index)
  end

  return FUNCTION
end
