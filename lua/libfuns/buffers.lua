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
      if file_path ~= "" and vim.fn.filereadable(file_path) == 1 then
        vim.fn.delete(file_path)
      end
      Snacks.bufdelete()
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
    local current_state = vim.wo.wrap
    vim.wo.wrap = not current_state
    vim.wo.linebreak = not current_state
  end

  FUNCTION.number_buffer = function()
    vim.opt.relativenumber = not vim.opt.relativenumber:get()
  end

  return FUNCTION
end
