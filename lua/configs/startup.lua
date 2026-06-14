do
  -- system
  vim.loader.enable()
  vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

  -- leader
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '

  -- mouse
  vim.o.mouse = 'a'

  -- loadtimes
  vim.o.updatetime = 250
  vim.o.timeoutlen = 300

  -- file
  vim.o.undofile = true
  vim.o.confirm = true
end
