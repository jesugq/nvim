do
  vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end)
  vim.keymap.set("n", "<leader>qL", function() require("persistence").select() end)
end
