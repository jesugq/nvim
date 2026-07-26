do
  vim.keymap.set("n", "<leader>qw", "<cmd>AutoSession toggle<CR>", { desc = 'Session save toggle' })
  vim.keymap.set("n", "<leader>qs", "<cmd>AutoSession save<CR>", { desc = 'Session save' })
  vim.keymap.set("n", "<leader>qS", "AutoSession save ", { desc = 'Session save as' })
  vim.keymap.set("n", "<leader>qf", "<cmd>AutoSession restore<CR>", { desc = 'Session find' })
  vim.keymap.set("n", "<leader>qF", "<cmd>AutoSession search<CR>", { desc = 'Session find from' })
  vim.keymap.set("n", "<leader>qd", "<cmd>AutoSession delete<CR>", { desc = 'Session delete' })
  vim.keymap.set("n", "<leader>qD", "<cmd>AutoSession deletePicker<CR>", { desc = 'Session delete from' })
end
