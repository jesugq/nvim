do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    callback = function()
      local api = require('obsidian.api')
      local folders = require('configs.folders')
      local insert = require('configs.insert')
      local tags = require('tags')
      local is_tagged = false
      local timer = nil

      vim.keymap.set('n', '<leader>bn', function() vim.cmd('e .md') end, {  desc = 'Markdown new file' })

      vim.keymap.set('n', '<A-CR>', api.smart_action, { expr = true, desc = 'Markdown open at point' })

      vim.keymap.set('n', '<C-c>e', function()
        local url = vim.fn.getreg('+'):gsub('^%s+', ''):gsub('%s+$', '')

        local row = vim.api.nvim_win_get_cursor(0)[1]
        local line = vim.api.nvim_get_current_line()
        local end_col = #line

        local text = '[](' .. url .. ')'
        vim.api.nvim_buf_set_text(0, row - 1, end_col, row - 1, end_col, { text })

        vim.api.nvim_win_set_cursor(0, { row, end_col + 1 })
        vim.cmd('startinsert')
      end, { buffer = true, desc = 'Markdown insert external link' })
      vim.keymap.set('n', '<C-c>r', function() vim.cmd('Obsidian quick_switch') end, {
        buffer = true, desc = 'Markdown refile text'
      })
      vim.keymap.set('n', '<C-c>t', function()
        insert.new_space()
        vim.cmd('stopinsert')
        vim.cmd('normal! A[[]]')
        vim.cmd('stopinsert')
        vim.cmd('normal! h')
        vim.cmd('startinsert')
      end, { buffer = true, desc = 'Markdown insert link to' })
      vim.keymap.set('n', '<C-c>i', function()
        if not is_tagged then
          is_tagged = true
          insert.new_hash(tags.nm)
        else
          is_tagged = false
          insert.bye_hash(tags.nm)
          return
        end

        if timer then
          timer:stop()
        else
          timer = vim.uv.new_timer()
        end

        timer:start(1000, 0,
          vim.schedule_wrap(function()
            is_tagged = false
            if timer and not timer:is_closing() then
              timer:close()
              timer = nil
            end
          end)
        )
      end, { buffer = true, desc = 'Markdown tags' })
      vim.keymap.set('n', '<C-c>o', function()
        insert.new_hash()
      end, { buffer = true, desc = 'Markdown tags' })

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
      end, { buffer = true, desc = 'Markdown insight' })
    end,
  })

  vim.api.nvim_create_autocmd("User", {
    pattern = "ObsidianNoteEnter",
    callback = function(ev)
      local insert = require('configs.insert')

      vim.keymap.del("n", "<CR>", { buffer = true })
      vim.keymap.del("n", "]o", { buffer = true })
      vim.keymap.del("n", "[o", { buffer = true })

      vim.keymap.set('n', '<CR>', function()
        insert.new_parent()
      end, { buffer = true, desc = 'Mark insert parent' })
      vim.keymap.set('n', '<C-CR>', function()
        insert.new_child()
      end, { buffer = true, desc = 'Mark insert child' })
    end,
  })
end
