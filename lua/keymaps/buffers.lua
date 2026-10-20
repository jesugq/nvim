do
  local function create_buffer(default)
    Snacks.input({ prompt = 'New file', default = default },
      function(input)
        if input and input ~= "" then
          vim.cmd('e ' .. input)
        end
      end
    )
  end

  -- <leader>b
  vim.keymap.set('n', '<leader>bb', '<C-^>', { desc = 'Buffer switch' })
  vim.keymap.set('n', '<leader>bc', function()
    local dir = vim.fn.expand('%:h')
    create_buffer((dir ~= '' and dir ~= '.') and (dir .. '/') or '')
  end, { desc = 'Buffer create' })
  vim.keymap.set('n', '<leader>bv', function()
    create_buffer('')
  end, { desc = 'Buffer create' })
  vim.keymap.set('n', '<leader>bz', function() Snacks.bufdelete() end, { desc = 'Buffer close' })
  vim.keymap.set('n', '<leader>bZ', function() Snacks.bufdelete.all() end, { desc = 'Buffer close' })
  vim.keymap.set('n', '<leader>bs', function() vim.cmd('w') end, { desc = 'Buffer save' })
  vim.keymap.set('n', '<leader>bS', function() vim.cmd('wa') end, { desc = 'Buffer save all' })
  vim.keymap.set('n', '<leader>bt', function() vim.cmd('checktime') end, { desc = 'Buffer checktime' })
  vim.keymap.set('n', '<leader>by', function() vim.cmd('recover') end, { desc = 'Buffer recover' })
  vim.keymap.set('n', '<leader>bk', function()
      local current_state = vim.wo.wrap
      vim.wo.wrap = not current_state
      vim.wo.linebreak = not current_state
  end, { desc = 'Toggle word wrap' })
  vim.keymap.set('n', '<leader>bl', function()
    vim.opt.relativenumber = not vim.opt.relativenumber:get()
  end, { desc = 'Toggle relative numbers' })
end
