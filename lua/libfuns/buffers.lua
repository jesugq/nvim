do
  local FUNCTION = {}

  FUNCTION.buffer_random = function(path)
    local full_path = vim.fn.expand(path)
    local buffered_files = {}
    local uv = vim.uv or vim.loop
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted then
        local name = vim.api.nvim_buf_get_name(buf)
        if name ~= '' then
          local normalized = uv.fs_realpath(name) or vim.fs.normalize(vim.fn.fnamemodify(name, ':p'))
          buffered_files[normalized] = true
        end
      end
    end

    local files = {}
    for name, type in vim.fs.dir(full_path) do
      if type == 'file' then
        local file = vim.fs.joinpath(full_path, name)
        local normalized = uv.fs_realpath(file) or vim.fs.normalize(vim.fn.fnamemodify(file, ':p'))
        if not buffered_files[normalized] then
          table.insert(files, file)
        end
      end
    end

    if #files == 0 then
      return
    end

    math.randomseed((vim.uv or vim.loop).hrtime())
    local file = files[math.random(#files)]

    local prev_buffer = vim.api.nvim_get_current_buf()
    vim.cmd('edit ' .. vim.fn.fnameescape(file))
    local next_buffer = vim.api.nvim_get_current_buf()

    local prev_valid = vim.api.nvim_buf_is_valid(prev_buffer)
    local prev_unique = prev_buffer ~= next_buffer

    if prev_valid and prev_unique then
      pcall(vim.api.nvim_buf_delete, prev_buffer, { force = true, })
    end
  end

  return FUNCTION
end
