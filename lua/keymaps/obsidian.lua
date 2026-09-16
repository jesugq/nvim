do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    callback = function()
      local folders = require('configs.folders')
      local api = require('obsidian.api')
      local insert = require('configs.insert')
      local linksert = require('configs.linksert')
      local snacks = require('configs.snacks')

      -- <???>
      vim.keymap.set('n', '<CR>', function()
        insert.new_parent()
      end, { buffer = true, desc = 'Mark insert parent' })
      vim.keymap.set('n', '<C-CR>', function()
        insert.new_child()
      end, { buffer = true, desc = 'Mark insert child' })
      vim.keymap.set('n', '<A-CR>', api.smart_action, { expr = true, desc = 'Markdown open at point' })

      -- <C-c>?
      vim.keymap.set('i', '<C-c>', '<Esc><C-c>')
      vim.keymap.set('n', '<C-c>i', function() linksert.markdown_link(true) end, {
        buffer = true, desc = 'Markdown insert internal link',
      })
      vim.keymap.set('n', '<C-c>o', function() linksert.markdown_link(false) end, {
        buffer = true, desc = 'Markdown insert external link',
      })
      vim.keymap.set('n', '<C-h>', function() snacks.incoming_links() end, {
        buffer = true, desc = 'Markdown incoming links',
      })
      vim.keymap.set('n', '<C-j>', function()
        folders.random_file(vim.fn.expand('%:.:h'), true)
      end, { buffer = true, desc = 'Markdown random file del' })
      vim.keymap.set('n', '<C-k>', function()
        folders.random_file(vim.fn.expand('%:.:h'), false)
      end, { buffer = true, desc = 'Markdown random file new' })
      vim.keymap.set('n', '<C-l>', function() snacks.outgoing_links() end, {
        buffer = true, desc = 'Markdown outgoing links',
      })
    end,
  })

  vim.api.nvim_create_autocmd('User', {
    pattern = 'ObsidianNoteEnter',
    callback = function(ev)
      local api = require('obsidian.api')
      local insert = require('configs.insert')

      -- <???>
      vim.keymap.del('n', '<CR>', { buffer = true })
      vim.keymap.del('n', ']o', { buffer = true })
      vim.keymap.del('n', '[o', { buffer = true })
      vim.keymap.set('n', '<CR>', function()
        insert.new_parent()
      end, { buffer = true, desc = 'Mark insert parent' })
      vim.keymap.set('n', '<C-CR>', function()
        insert.new_child()
      end, { buffer = true, desc = 'Mark insert child' })
      vim.keymap.set('n', '<A-CR>', api.smart_action, { expr = true, desc = 'Markdown open at point' })
    end,
  })
end
