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
  vim.opt.listchars = {
    tab = '> ',
    trail = '.',
    nbsp = '_'
  }

  -- folds
  vim.opt.foldlevelstart = 0
  vim.opt.foldmethod = 'expr'
  vim.opt.foldexpr = 'v:lua.vim.lsp.foldexpr()'
end
