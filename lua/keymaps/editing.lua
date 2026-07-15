do
  vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Undo highlight search'} )
  vim.keymap.set('n', '<C-[>', '<cmd>nohlsearch<CR>', { desc = 'Undo highlight search'} )

  vim.keymap.set('n', 'o', 'o<Esc>', { remap = false, desc = 'New line below normal mode' })
  vim.keymap.set('n', 'O', 'O<Esc>', { remap = false, desc = 'New line above normal mode' })

  vim.keymap.set('n', '<Tab>', 'za', { noremap = true, silent = true })
  vim.keymap.set('n', '<S-Tab>', function()
    if vim.wo.foldlevel > 0 then
      vim.cmd('normal! zM')
    else
      vim.cmd('normal! zR')
    end
  end, { noremap = true, silent = true })
  vim.keymap.set("n", "<C-i>", "<C-i>", { noremap = true })
end
