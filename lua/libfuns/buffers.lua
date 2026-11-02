do
  local FUNCTION = {}

  FUNCTION.add_buffer = function()
    Snacks.input({ prompt = 'Buffer name', default = vim.fn.expand('%:h') .. '/' },
      function(input)
        if input and input ~= "" then
          vim.cmd('e ' .. input)
        end
      end
    )
  end

  FUNCTION.delete_buffer = function()
    local file_path = vim.api.nvim_buf_get_name(0)
    local file_name = vim.fn.expand('%:t')
    if file_name == "" then file_name = "[No Name]" end
    local choice = vim.fn.confirm("Buffer delete: " .. file_name .. "?", "&Yes\n&No", 2)
    if choice == 1 then
      if file_path ~= "" and vim.bo.modified then
        vim.cmd('w')
      end
      if file_path ~= "" and vim.fn.filereadable(file_path) == 1 then
        vim.fn.delete(file_path)
      end
      Snacks.bufdelete({ force = true })
    end
  end

  FUNCTION.rename_buffer = function()
    local old_name = vim.api.nvim_buf_get_name(0)
    Snacks.input({ prompt = 'Buffer name', default = old_name }, function(new_name)
      if new_name and new_name ~= "" then
        vim.fn.rename(old_name, new_name)
        vim.cmd('keepalt file ' .. vim.fn.fnameescape(new_name))
        vim.cmd('silent! write')
      end
    end)
  end

  FUNCTION.wrap_buffer = function()
    local new_state = not vim.o.wrap

    vim.o.wrap = new_state
    vim.o.linebreak = new_state

    for _, win in ipairs(vim.api.nvim_list_wins()) do
      vim.api.nvim_set_option_value('wrap', new_state, { win = win })
      vim.api.nvim_set_option_value('linebreak', new_state, { win = win })
    end
  end

  FUNCTION.number_buffer = function()
    vim.opt.relativenumber = not vim.opt.relativenumber:get()
  end

  FUNCTION.random_file = function(path)
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
      pcall(Snacks.bufdelete.delete, { buf = prev_buffer, })
    end
  end

  return FUNCTION
end
