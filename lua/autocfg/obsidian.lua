do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    callback = function()
      vim.opt.conceallevel = 1
      vim.opt.expandtab = true
      vim.opt.shiftwidth = 2
      vim.opt.tabstop = 2
      vim.opt.softtabstop = 2
    end,
  })

  vim.api.nvim_create_autocmd("User", {
    pattern = "ObsidianNoteEnter",
    callback = function(ev)
      vim.keymap.del("n", "<CR>", { buffer = true })
      vim.keymap.del("n", "]o", { buffer = true })
      vim.keymap.del("n", "[o", { buffer = true })

      vim.keymap.set('n', '<CR>', function()
        vim.api.nvim_put({ '# ' }, 'c', false, true)
        vim.cmd('startinsert!')
      end, { buffer = true, desc = 'Mark insert parent' })
      vim.keymap.set('n', '<C-CR>', function()
        vim.cmd('startinsert')
      end, { buffer = true, desc = 'Mark insert child' })
    end,
  })
end
