do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    callback = function()
      vim.keymap.set('n', '<leader>ab', ':Obsidian backlinks<CR>', {
        buffer = true, desc = 'Mark backlinks'
      })
      vim.keymap.set('n', '<leader>al', ':Obsidian links<CR>', {
        buffer = true, desc = 'Mark links'
      })
      vim.keymap.set('n', '<leader>ar', ':Obsidian rename<CR>', {
        buffer = true, desc = 'Mark rename'
      })
      vim.keymap.set('n', '<leader>ap', ':Obsidian paste_img<CR>', {
        buffer = true, desc = 'Mark paste image'
      })
      vim.keymap.set('n', '<leader>ai', function()
        local full_path = vim.fn.expand('01 insights')
        local safe_path = vim.fn.shellescape(full_path)

        local cmd = string.format('find %s -type f | shuf -n 1', safe_path)
        local file = vim.fn.system(cmd):gsub('\n', '')

        if file ~= '' then
          vim.cmd('bd')
          vim.cmd('edit ' .. file)
        end
      end, { buffer = true, desc = 'Mark open random' })
    end,
  })
end
