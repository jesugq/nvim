do
  -- <leader>q
  vim.keymap.set('n', '<leader>qq', function() vim.cmd('qa') end, { desc = 'Quit all' })
  vim.keymap.set('n', '<leader>qr', function() vim.cmd('restart!') end, { desc = 'Quit restart!'})
  vim.keymap.set('n', '<leader>qR', function() vim.cmd('restart') end, { desc = 'Quit restart'})

  -- <leader>o
  vim.keymap.set('n', '<leader>os', function() vim.cmd('AutoSession save') end, { desc = 'Session save' })
  vim.keymap.set('n', '<leader>oc', function()
    local cwd_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
    Snacks.input({
      prompt = 'AutoSession name',
      default = cwd_name .. '/',
    }, function(input)
      if input and input ~= '' then
        vim.cmd('AutoSession save ' .. input)
      end
    end)
  end, { desc = 'Session create' })
  vim.keymap.set('n', '<leader>ov', function()
    Snacks.input({ prompt = 'AutoSession name' },
      function(input)
        if input and input ~= '' then
          vim.cmd('AutoSession save ' .. input)
        end
      end
    )
  end, { desc = 'Session create' })
  vim.keymap.set('n', '<leader>oz', function() vim.cmd('AutoSession deletePicker') end, { desc = 'Session close' })
end
