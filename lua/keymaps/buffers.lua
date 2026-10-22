do
  -- <leader>b
  vim.keymap.set('n', '<leader>ba', function()
    Snacks.input({ prompt = 'Buffer name', default = vim.fn.expand('%:h') .. '/' },
      function(input)
        if input and input ~= "" then
          vim.cmd('e ' .. input)
        end
      end
    )
  end, { desc = 'Buffer add' })
  vim.keymap.set('n', '<leader>bb', '<C-^>', { desc = 'Buffer switch' })
  vim.keymap.set('n', '<leader>bc', function() Snacks.bufdelete() end, { desc = 'Buffer close' })
  vim.keymap.set('n', '<leader>bC', function() Snacks.bufdelete.all() end, { desc = 'Buffer close' })
  vim.keymap.set('n', '<leader>bd', function()
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
  end, { desc = 'Buffer delete' })
  vim.keymap.set('n', '<leader>bn', function()
    local old_name = vim.api.nvim_buf_get_name(0)
    Snacks.input({ prompt = 'Buffer name', default = old_name }, function(new_name)
      if new_name and new_name ~= "" then
        vim.fn.rename(old_name, new_name)
        vim.cmd('keepalt file ' .. vim.fn.fnameescape(new_name))
        vim.cmd('silent! write')
      end
    end)
  end, { desc = 'Buffer name' })
  vim.keymap.set('n', '<leader>bs', function() vim.cmd('w') end, { desc = 'Buffer save' })
  vim.keymap.set('n', '<leader>bS', function() vim.cmd('wa') end, { desc = 'Buffer save all' })
  vim.keymap.set('n', '<leader>bt', function() vim.cmd('checktime') end, { desc = 'Buffer time' })
  vim.keymap.set('n', '<leader>by', function() vim.cmd('recover') end, { desc = 'Buffer yield' })
  vim.keymap.set('n', '<leader>bk', function()
      local current_state = vim.wo.wrap
      vim.wo.wrap = not current_state
      vim.wo.linebreak = not current_state
  end, { desc = 'Buffer knit' })
  vim.keymap.set('n', '<leader>bl', function()
    vim.opt.relativenumber = not vim.opt.relativenumber:get()
  end, { desc = 'Buffer line' })
end
