do
  local windows = require('configs.windows')

  vim.keymap.set('n', '<C-b>a', function()
    vim.cmd('split')
    windows.deequalize()
    vim.cmd('e prompt')
  end, { desc = 'File save' })
  vim.keymap.set('n', '<C-b>s', function() vim.cmd('w') end, { desc = 'File save' })
  vim.keymap.set('n', '<C-b>S', function() vim.cmd('wa') end, { desc = 'File save all' })

  vim.keymap.set('n', '<C-b><C-b>', '<C-^>', { desc = 'Buffer switch' })

  vim.keymap.set('n', '<C-b>p', function() vim.cmd('checktime') end, { desc = 'Buffer refresh' })
  vim.keymap.set('n', '<C-b>k', function()
      local current_state = vim.wo.wrap
      vim.wo.wrap = not current_state
      vim.wo.linebreak = not current_state
  end, { desc = 'Toggle word wrap' })
  vim.keymap.set('n', '<C-b>l', function()
    vim.opt.relativenumber = not vim.opt.relativenumber:get()
  end, { desc = 'Toggle relative numbers' })
end
