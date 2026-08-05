do
  local FUNCTION = {}

  FUNCTION.random_file = function(path, opts)
    opts = opts or {}
    local replace = opts.replace or false
    local wrap = opts.wrap or false

    local full_path = vim.fn.expand(path)
    local files = vim.fs.find(function() return true end, {
        path = full_path,
        type = 'file',
        limit = math.huge,
      })

    if #files == 0 then
      return
    end

    math.randomseed(os.time())
    local file = files[math.random(#files)]

    local prev_buffer = vim.api.nvim_get_current_buf()
    vim.cmd('edit ' .. vim.fn.fnameescape(file))
    local next_buffer = vim.api.nvim_get_current_buf()

    local prev_valid = vim.api.nvim_buf_is_valid(prev_buffer)
    local prev_diff = prev_buffer ~= next_buffer

    if wrap then
      vim.wo.wrap = true
      vim.wo.linebreak = true
    end

    if replace and prev_valid and prev_diff then
      pcall(Snacks.bufdelete.delete, { buf = prev_buffer })
    end
  end

  return FUNCTION
end
