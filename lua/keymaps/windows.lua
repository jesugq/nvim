do
  vim.keymap.set('n', '<C-w>c', '<Nop>', { desc = 'Close current window' })
  vim.keymap.set('n', '<C-w>x', '<C-w>c', { remap = false, desc = 'Close current window' })

  vim.keymap.set('n', '<C-w>H', '<Nop>', { desc = 'Move window left' })
  vim.keymap.set('n', '<C-w>J', '<Nop>', { desc = 'Move window down' })
  vim.keymap.set('n', '<C-w>K', '<Nop>', { desc = 'Move window up' })
  vim.keymap.set('n', '<C-w>L', '<Nop>', { desc = 'Move window right' })
  vim.keymap.set('n', '<C-w>h', '<C-w>H', { remap = false, desc = 'Move window left' })
  vim.keymap.set('n', '<C-w>j', '<C-w>J', { remap = false, desc = 'Move window down' })
  vim.keymap.set('n', '<C-w>k', '<C-w>K', { remap = false, desc = 'Move window up' })
  vim.keymap.set('n', '<C-w>l', '<C-w>L', { remap = false, desc = 'Move window right' })

  vim.keymap.set("n", "<C-w>m", function()
      if #vim.api.nvim_list_tabpages() > 1 then
          vim.cmd("tabclose")
      else
          vim.cmd("tab split")
      end
  end, { desc = "Toggle maximize window" })
end
