do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    callback = function()
      vim.keymap.set({'n', 'i'}, '<C-c>a', function()
        local formatted_date = os.date('<%Y-%m-%d %a>')
        vim.api.nvim_put({ formatted_date }, 'c', true, true)
      end, { buffer = true, desc = 'Mark insert date' })
      vim.keymap.set({'n', 'i'}, '<C-c>r', ':Obsidian rename<CR>', {
        buffer = true, desc = 'Mark rename'
      })
      vim.keymap.set({'n', 'i'}, '<C-c>p', ':Obsidian paste_img<CR>', {
        buffer = true, desc = 'Mark paste image'
      })
      vim.keymap.set('n', '<C-c>b', ':Obsidian backlinks<CR>', {
        buffer = true, desc = 'Mark backlinks'
      })
      vim.keymap.set('n', '<C-c>o', ':Obsidian links<CR>', {
        buffer = true, desc = 'Mark outgoing links'
      })
      vim.keymap.set('n', '<C-c>i', function()
        local full_path = vim.fn.expand('3-insights')
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
