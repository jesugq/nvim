do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    callback = function()
      local folders = require('configs.folders')
      local insert = require('configs.insert')
      local tags = require('tags')

      vim.keymap.set('n', '<C-c>p', '<cmd>Obsidian paste_img<CR><cmd>', {
        buffer = true, desc = 'Markdown paste image'
      })
      vim.keymap.set('n', '<C-c>c', function()
        insert.new_hash()
      end, { buffer = true, desc = 'Markdown tags' })
      vim.keymap.set('n', '<C-c>r', '<cmd>Obsidian quick_switch<CR><cmd>', {
        buffer = true, desc = 'Markdown quick switch'
      })
      vim.keymap.set('n', '<C-c>t', 'i[[]]<Esc>hhli', {
        buffer = true, desc = 'Markdown link'
      })

      vim.keymap.set('n', '<C-c><', '<cmd>Obsidian backlinks<CR><cmd>', {
        buffer = true, desc = 'Markdown incoming links'
      })
      vim.keymap.set('n', '<C-c>>', '<cmd>Obsidian links<CR><cmd>', {
        buffer = true, desc = 'Markdown outgoing links'
      })

      vim.keymap.set('n', '<leader>ai', tags.md.inner, { buffer = true, desc = 'Markdown Inner' })
      vim.keymap.set('n', '<leader>ao', tags.md.outer, { buffer = true, desc = 'Markdown Outer' })

      vim.keymap.set('n', '<leader>a1', function()
        folders.random_file('1-projects')
      end, { buffer = true, desc = 'Markdown project' })
      vim.keymap.set('n', '<leader>a2', function()
        folders.random_file('2-notepads')
      end, { buffer = true, desc = 'Markdown notepad' })
      vim.keymap.set('n', '<leader>a3', function()
        folders.random_file('3-features')
      end, { buffer = true, desc = 'Markdown feature' })
      vim.keymap.set('n', '<leader>a4', function()
        folders.random_file('4-insights')
        vim.wo.wrap = true
        vim.wo.linebreak = true
      end, { buffer = true, desc = 'Markdown insight' })
    end,
  })
end
