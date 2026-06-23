do
  vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { desc = 'Load last session' })
  vim.keymap.set("n", "<leader>qL", function() require("persistence").select() end, { desc = 'Load selected session' })
end
