do
  local windows = require('configs.windows')

  local function create_buffer(default)
    Snacks.input({ prompt = 'New file', default = default },
      function(input)
        if input and input ~= "" then
          vim.cmd('e ' .. input)
        end
      end
    )
  end

  -- <C-b>
  vim.keymap.set('n', '<C-b><C-b>', '<C-^>', { desc = 'Buffer switch' })
  vim.keymap.set('n', '<C-b>a', function()
    vim.cmd('split')
    windows.deequalize()
    vim.cmd('e prompt')
  end, { desc = 'Buffer ai' })
  vim.keymap.set('n', '<C-b>c', function()
    create_buffer('')
  end, { desc = 'Buffer create' })
  vim.keymap.set('n', '<C-b>C', function()
    local dir = vim.fn.expand('%:h')
    create_buffer((dir ~= '' and dir ~= '.') and (dir .. '/') or '')
  end, { desc = 'Buffer create dir' })
  vim.keymap.set('n', '<C-b>l', function()
    vim.opt.relativenumber = not vim.opt.relativenumber:get()
  end, { desc = 'Toggle relative numbers' })
  vim.keymap.set('n', '<C-b>o', function()
      local current_state = vim.wo.wrap
      vim.wo.wrap = not current_state
      vim.wo.linebreak = not current_state
  end, { desc = 'Toggle word wrap' })
  vim.keymap.set('n', '<C-b>s', function() vim.cmd('w') end, { desc = 'Buffer save' })
  vim.keymap.set('n', '<C-b>S', function() vim.cmd('wa') end, { desc = 'Buffer save all' })
  vim.keymap.set('n', '<C-b>t', function() vim.cmd('checktime') end, { desc = 'Buffer checktime' })
  vim.keymap.set('n', '<C-b>u', function() vim.cmd('recover') end, { desc = 'Buffer recover' })
end
