do
  vim.cmd("filetype plugin indent on")

  vim.opt.expandtab = true   -- Convert tabs to spaces
  vim.opt.tabstop = 4        -- Insert 4 spaces for a tab
  vim.opt.shiftwidth = 4     -- Change the number of space characters inserted for indentation
  vim.opt.softtabstop = 4    -- Number of spaces that a <Tab> counts for while performing editing operations

  vim.api.nvim_create_autocmd("Filetype", {
    pattern = { "javascript", "typescript", "html", "css", "json", "lua" },
    callback = function()
      vim.opt_local.tabstop = 2
      vim.opt_local.shiftwidth = 2
      vim.opt_local.softtabstop = 2
    end,
  })
end
