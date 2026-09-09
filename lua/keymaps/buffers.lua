do
  vim.keymap.set('n', '<leader>qq', function() vim.cmd('qa') end, { desc = 'Quit all' })
  vim.keymap.set('n', '<leader>qr', function() vim.cmd('restart!') end, { desc = 'Quit restart'})

  vim.keymap.set('n', '<leader>bs', function() vim.cmd('w') end, { desc = 'File save' })
  vim.keymap.set('n', '<leader>bS', function() vim.cmd('wa') end, { desc = 'File save all' })

  vim.keymap.set('n', '<leader><leader>', '<C-^>', { desc = 'Buffer switch' })

  vim.keymap.set('n', '<leader>br', function() vim.cmd('checktime') end, { desc = 'Buffer refresh' })
  vim.keymap.set('n', '<leader>bw', function()
      local current_state = vim.wo.wrap
      vim.wo.wrap = not current_state
      vim.wo.linebreak = not current_state
  end, { desc = 'Toggle word wrap' })
  vim.keymap.set('n', '<leader>bl', function()
    vim.opt.relativenumber = not vim.opt.relativenumber:get()
  end, { desc = 'Toggle relative numbers' })
end
