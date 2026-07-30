do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    callback = function()
      local function random_md(path, replace)
        local full_path = vim.fn.expand(path)
        local safe_path = vim.fn.shellescape(full_path)

        local cmd = string.format('find %s -type f | shuf -n 1', safe_path)
        local file = vim.fn.system(cmd):gsub('\n', '')

        if file ~= '' then
          local old_buf = vim.api.nvim_get_current_buf()
          vim.cmd('edit ' .. file)
          if vim.api.nvim_buf_is_valid(old_buf) and replace then
            pcall(vim.cmd, 'bdelete ' .. old_buf)
          end
        end
      end

      vim.keymap.set({'n', 'i'}, '<C-c>p', ':Obsidian paste_img<CR>', {
        buffer = true, desc = 'Markdown paste image'
      })

      vim.keymap.set('n', '<C-c><', ':Obsidian backlinks<CR>', {
        buffer = true, desc = 'Markdown incoming links'
      })
      vim.keymap.set('n', '<C-c>>', ':Obsidian links<CR>', {
        buffer = true, desc = 'Markdown outgoing links'
      })

      vim.keymap.set('n', '<leader>ap', function()
        random_md('1-projects', true)
      end, { buffer = true, desc = 'Markdown project' })
      vim.keymap.set('n', '<leader>af', function()
        random_md('2-features', true)
      end, { buffer = true, desc = 'Markdown feature' })
      vim.keymap.set('n', '<leader>ai', function()
        random_md('3-insights', true)
        vim.wo.wrap = true
        vim.wo.linebreak = true
      end, { buffer = true, desc = 'Markdown insight' })
      vim.keymap.set('n', '<leader>an', function()
        random_md('4-notepads', true)
      end, { buffer = true, desc = 'Markdown notepad' })
    end,
  })
end
