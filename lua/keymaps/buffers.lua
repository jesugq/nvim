do
  local windows = require('configs.windows')
  local folders = require('configs.folders')

  vim.keymap.set('n', '<C-b>a', function()
    vim.cmd('split')
    windows.deequalize()
    vim.cmd('e prompt')
  end, { desc = 'File save' })
  vim.keymap.set('n', '<C-b>s', function() vim.cmd('w') end, { desc = 'File save' })
  vim.keymap.set('n', '<C-b>S', function() vim.cmd('wa') end, { desc = 'File save all' })

  vim.keymap.set('n', '<C-b><C-b>', '<C-^>', { desc = 'Buffer switch' })

  vim.keymap.set('n', '<C-b>t', function() vim.cmd('checktime') end, { desc = 'Buffer refresh' })
  vim.keymap.set('n', '<C-b>o', function()
      local current_state = vim.wo.wrap
      vim.wo.wrap = not current_state
      vim.wo.linebreak = not current_state
  end, { desc = 'Toggle word wrap' })
  vim.keymap.set('n', '<C-b>l', function()
    vim.opt.relativenumber = not vim.opt.relativenumber:get()
  end, { desc = 'Toggle relative numbers' })

  vim.keymap.set('n', '<C-b>1', function() folders.open_named('@daily') end, { desc = 'Open daily' })
  vim.keymap.set('n', '<C-b>2', function() folders.open_named('@focus') end, { desc = 'Open focus' })
  vim.keymap.set('n', '<C-b>3', function() folders.open_named('@inbox') end, { desc = 'Open inbox' })
end
