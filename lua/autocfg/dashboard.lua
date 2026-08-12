do
  vim.api.nvim_create_autocmd("VimEnter", {
    nested = true,
    callback = function()
      local buf = vim.api.nvim_get_current_buf()
      local buf_name = vim.api.nvim_buf_get_name(buf)

      if buf_name ~= "" and vim.fn.isdirectory(buf_name) == 1 then
        vim.api.nvim_buf_delete(buf, { force = true })
        vim.cmd("Dashboard")
      end
    end,
  })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "dashboard", "dashboard-nvim" },
    callback = function()
      vim.schedule(function()
        vim.fn.clearmatches()
        vim.cmd("match none")
      end)
    end,
  })
end
