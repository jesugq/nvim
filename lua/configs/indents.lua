do
  vim.cmd("filetype plugin indent on")

  vim.opt.expandtab = true   -- Convert tabs to spaces
  vim.opt.tabstop = 4        -- Insert 4 spaces for a tab
  vim.opt.shiftwidth = 4     -- Change the number of space characters inserted for indentation
  vim.opt.softtabstop = 4    -- Number of spaces that a <Tab> counts for while performing editing operations
end
