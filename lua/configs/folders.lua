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

  FUNCTION.open_named = function(stem)
    local found = vim.fs.find(function(name)
      return name == stem or vim.startswith(name, stem .. '.')
    end, { path = vim.uv.cwd(), limit = 1, type = 'file' })

    if found[1] then
      vim.cmd.edit(vim.fn.fnameescape(found[1]))
      return
    end

    vim.notify('No ' .. stem .. ' file found', vim.log.levels.WARN)
  end

  return FUNCTION
end
