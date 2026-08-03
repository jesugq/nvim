do
  vim.keymap.set("n", "<leader>bd", function()
    vim.cmd("only")
    vim.cmd("Dashboard")
  end, { desc = 'Buffer dashboard' })
end
