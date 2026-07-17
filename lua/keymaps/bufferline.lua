do
  vim.keymap.set('n', ']b', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Switch Buffer Next' })
  vim.keymap.set('n', '[b', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Switch Buffer Prev' })
  vim.keymap.set("n", "<leader>b[", "<cmd>BufferLineMovePrev<CR>", { desc = "Move Buffer prev" })
  vim.keymap.set("n", "<leader>b]", "<cmd>BufferLineMoveNext<CR>", { desc = "Move Buffer next" })
end
