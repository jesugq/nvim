do
  vim.keymap.set("n", "<leader>bd", function()
    vim.cmd("Dashboard")
  end, { desc = 'Buffer dashboard' })
end
