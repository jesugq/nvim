do
  vim.api.nvim_create_autocmd("Filetype", {
    pattern = { "javascript", "typescript", "html", "css", "json", "lua" },
    callback = function()
      vim.opt_local.tabstop = 2
      vim.opt_local.shiftwidth = 2
      vim.opt_local.softtabstop = 2
    end,
  })
end
