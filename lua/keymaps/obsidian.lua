do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    callback = function()
      local api = require('obsidian.api')
      local folders = require('configs.folders')
      local insert = require('configs.insert')
      local linksert = require('configs.linksert')

      vim.keymap.set('n', '<C-b>n', function() vim.cmd('e .md') end, {  desc = 'Markdown new file' })

      vim.keymap.set('n', '<C-c>e', function() linksert.markdown_link(false) end, {
        buffer = true, desc = 'Markdown insert external link',
      })
      vim.keymap.set('n', '<C-c>t', function() linksert.markdown_link(true) end, {
        buffer = true, desc = 'Markdown insert internal link',
      })
      vim.keymap.set('n', '<C-c>r', function() vim.cmd('Obsidian quick_switch') end, {
        buffer = true, desc = 'Markdown refile text',
      })

      vim.keymap.set('n', '<C-h>', function() vim.cmd('Obsidian backlinks') end, {
        buffer = true, desc = 'Markdown incoming links',
      })
      vim.keymap.set('n', '<C-l>', function() vim.cmd('Obsidian links') end, {
        buffer = true, desc = 'Markdown outgoing links',
      })

      vim.keymap.set('n', '<leader>a1', function()
        folders.random_file('1-programs')
      end, { buffer = true, desc = 'Markdown program' })
      vim.keymap.set('n', '<leader>a2', function()
        folders.random_file('2-notepads')
      end, { buffer = true, desc = 'Markdown notepad' })
      vim.keymap.set('n', '<leader>a3', function()
        folders.random_file('3-features')
      end, { buffer = true, desc = 'Markdown feature' })
      vim.keymap.set('n', '<leader>a4', function()
        folders.random_file('4-insights')
      end, { buffer = true, desc = 'Markdown insight' })

      vim.keymap.set('n', '<CR>', function()
        insert.new_parent()
      end, { buffer = true, desc = 'Mark insert parent' })
      vim.keymap.set('n', '<C-CR>', function()
        insert.new_child()
      end, { buffer = true, desc = 'Mark insert child' })
      vim.keymap.set('n', '<A-CR>', api.smart_action, { expr = true, desc = 'Markdown open at point' })
    end,
  })

  vim.api.nvim_create_autocmd('User', {
    pattern = 'ObsidianNoteEnter',
    callback = function(ev)
      local api = require('obsidian.api')
      local insert = require('configs.insert')

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
