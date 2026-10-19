do
  local last_session = nil

  local function get_current_session_name()
    if vim.v.this_session == "" then
      return vim.fn.getcwd()
    end
    local name = vim.fn.fnamemodify(vim.v.this_session, ":t:r")
    name = string.gsub(name, "%%(%x%x)", function(hex)
      return string.char(tonumber(hex, 16))
    end)
    return name
  end

  -- <leader>q
  vim.keymap.set('n', '<leader>qq', function() vim.cmd('qa') end, { desc = 'Quit all' })
  vim.keymap.set('n', '<leader>qr', function() vim.cmd('restart!') end, { desc = 'Quit restart!'})
  vim.keymap.set('n', '<leader>qR', function() vim.cmd('restart') end, { desc = 'Quit restart'})

  -- <leader>o
  vim.keymap.set('n', '<leader>oo', function()
    local current = get_current_session_name()
    if last_session then
      vim.cmd('AutoSession save')
      vim.api.nvim_cmd({
        cmd = 'AutoSession',
        args = { 'restore', last_session }
      }, {})
      last_session = current
    else
      vim.notify('None', vim.log.levels.WARN)
    end
  end, { desc = 'Session save' })
  vim.keymap.set('n', '<leader>os', function() vim.cmd('AutoSession save') end, { desc = 'Session save' })
  vim.keymap.set('n', '<leader>of', function()
    local current = get_current_session_name()
    if current then
      last_session = current
    end
    vim.cmd('AutoSession save')
    vim.cmd('AutoSession search')
  end, { desc = 'Session find' })
  vim.keymap.set('n', '<leader>oa', function()
    Snacks.input({ prompt = 'AutoSession name' },
      function(input)
        if input and input ~= '' then
          vim.cmd('AutoSession save ' .. input)
        end
      end
    )
  end, { desc = 'Session append' })
  vim.keymap.set('n', '<leader>od', function() vim.cmd('AutoSession deletePicker') end, { desc = 'Session delete' })
end
