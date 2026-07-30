---@diagnostic disable: different-requires
do
  vim.pack.add { 'https://github.com/rmagatti/auto-session' }
  require('auto-session').setup {
    close_unsupported_windows = true,
    post_restore_cmds = {
      function()
        vim.cmd('only')
        vim.cmd('Dashboard')
      end,
    },
  }
  vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
end
