do
  vim.keymap.set("n", "<C-w>m", "<cmd>ZenMode<CR>", { desc = 'Window zen mode' })
  vim.keymap.set("n", "<leader>bm", "<cmd>ZenMode<CR>", { desc = 'Buffer zen mode' })
end
