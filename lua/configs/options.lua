do
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
end
