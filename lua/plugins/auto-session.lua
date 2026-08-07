---@diagnostic disable: different-requires
do
  vim.pack.add { 'https://github.com/rmagatti/auto-session' }
  require('auto-session').setup {
    auto_create = false,
    close_unsupported_windows = true,
  }
  vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
end
