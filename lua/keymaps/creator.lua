do
  local folders = require('configs.folders')

  local function create_buffer(default)
    Snacks.input({ prompt = 'New file', default = default },
      function(input)
        if input and input ~= "" then
          vim.cmd('e ' .. input)
        end
      end
    )
  end

  -- <Esc>
  vim.keymap.set('n', '<C-[>', function() vim.cmd('nohlsearch') end, { desc = 'Undo highlight search'} )
  vim.keymap.set('n', '<Esc>', function() vim.cmd('nohlsearch') end, { desc = 'Undo highlight search'} )

  -- <C-?>
  vim.keymap.set('n', '<C-;>', function()
    folders.atsign_file()
  end, { desc = 'Open atsign' })
  vim.keymap.set('n', '<C-b>c', function()
    create_buffer('')
  end, { desc = 'Buffer create' })
  vim.keymap.set('n', '<C-b>C', function()
    local dir = vim.fn.expand('%:h')
    create_buffer((dir ~= '' and dir ~= '.') and (dir .. '/') or '')
  end, { desc = 'Buffer create dir' })
  vim.keymap.set('i', '<C-b>', '<Esc>', { remap = true })
  vim.keymap.set('i', '<C-c>', '<Esc>', { remap = true })
  vim.keymap.set('i', '<C-w>', '<Esc>', { remap = true })

  -- ?
  vim.keymap.set('n', 'o', 'o<Esc>', { remap = false, desc = 'New line below normal mode' })
  vim.keymap.set('n', 'O', 'O<Esc>', { remap = false, desc = 'New line above normal mode' })
end
