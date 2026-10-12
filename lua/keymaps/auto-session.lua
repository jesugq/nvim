do
  -- <leader>q
  vim.keymap.set('n', '<leader>qq', function() vim.cmd('qa') end, { desc = 'Quit all' })
  vim.keymap.set('n', '<leader>qr', function() vim.cmd('restart!') end, { desc = 'Quit restart!'})
  vim.keymap.set('n', '<leader>qR', function() vim.cmd('restart') end, { desc = 'Quit restart'})

  -- <leader>o
  vim.keymap.set('n', '<leader>os', function() vim.cmd('AutoSession save') end, { desc = 'Session save' })
  vim.keymap.set('n', '<leader>of', function() vim.cmd('AutoSession search') end, { desc = 'Session find from' })
  vim.keymap.set('n', '<leader>oa', function()
    Snacks.input({ prompt = 'AutoSession name' },
      function(input)
        if input and input ~= "" then
          vim.cmd('AutoSession save ' .. input)
        end
      end
    )
  end, { desc = 'Session create' })
  vim.keymap.set('n', '<leader>od', function() vim.cmd('AutoSession deletePicker') end, { desc = 'Session delete from' })
end
