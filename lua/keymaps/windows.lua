do
  vim.keymap.set('n', '<C-w>c', '<Nop>', { desc = 'Close current window' })
  vim.keymap.set('n', '<C-w>x', '<C-w>c', { remap = false, desc = 'Close current window' })

  vim.keymap.set("n", "<C-w>m", function()
      if #vim.api.nvim_list_tabpages() > 1 then
          vim.cmd("tabclose")
      else
          vim.cmd("tab split")
      end
  end, { desc = "Toggle maximize window" })
end
