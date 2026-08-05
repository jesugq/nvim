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
  vim.o.timeoutlen = 250

  -- file
  vim.o.undofile = true
  vim.o.confirm = true
  vim.o.autoread = true

  -- mode
  vim.o.showmode = false

  -- search
  vim.o.ignorecase = true
  vim.o.smartcase = true
  vim.o.inccommand = 'split'

  -- cursor
  vim.o.number = true
  vim.o.cursorline = true
  vim.o.scrolloff = 8

  -- column
  vim.o.relativenumber = true
  vim.o.signcolumn = 'yes'

  -- lines
  vim.o.wrap = false
  vim.o.list = true

  -- folds
  vim.opt.foldcolumn = "1"
  require('configs.fillchars').highlights()

  -- indents
  vim.opt.tabstop = 2
  vim.opt.shiftwidth = 2
  vim.opt.expandtab = true

  -- checktime
  vim.o.autoread = true

  -- splits
  vim.opt.splitbelow = true
  vim.opt.splitright = true

  -- netrw
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
end
