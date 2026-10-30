do
  -- <leader>c
  vim.keymap.set('n', '<leader>hs', function()
    vim.cmd('edit staging.diff')
    vim.cmd('normal! ggdG')
    vim.cmd('0read !git diff origin/staging...HEAD')
    vim.cmd('$d')
    vim.cmd('normal! gg')
  end, { desc = '[h]unk [s]taging diff origin' })
  vim.keymap.set('n', '<leader>hS', function()
    vim.cmd('edit staging.diff')
    vim.cmd('normal! ggdG')
    vim.cmd('0read !git diff staging...HEAD')
    vim.cmd('$d')
    vim.cmd('normal! gg')
  end, { desc = '[h]unk [s]taging diff local' })
end
