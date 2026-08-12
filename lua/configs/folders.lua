do
  local FUNCTION = {}

  FUNCTION.random_file = function(path)

    local full_path = vim.fn.expand(path)
    local files = vim.fs.find(function() return true end, {
        path = full_path,
        type = 'file',
        limit = math.huge,
      })

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
    local prev_diff = prev_buffer ~= next_buffer
    local prev_sibling = vim.fs.dirname(prev_name) == vim.fs.dirname(next_name)

    if prev_valid and prev_diff and prev_sibling then
      pcall(Snacks.bufdelete.delete, { buf = prev_buffer })
    end
  end

  return FUNCTION
end
