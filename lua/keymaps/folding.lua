do
  vim.keymap.set('n', '<Tab>', 'za', { noremap = true, silent = true })
  vim.keymap.set('n', '<S-Tab>', function()
    if vim.wo.foldlevel > 0 then
      vim.cmd('normal! zM')
    else
      vim.cmd('normal! zR')
    end
  end, { noremap = true, silent = true })
  vim.keymap.set('n', '<C-i>', '<C-i>', { noremap = true })
end
