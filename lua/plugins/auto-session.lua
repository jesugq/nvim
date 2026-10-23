---@diagnostic disable: different-requires
do
  vim.pack.add { 'https://github.com/rmagatti/auto-session' }
  local auto_session = require('libfuns.auto-session')
  require('auto-session').setup {
    auto_create = false,
    auto_save_enabled = true,
    close_unsupported_windows = true,
    cwd_change_handling = true,
    pre_restore_cmds = { auto_session.snapshot_marks },
    post_restore_cmds = { auto_session.restore_marks },
  }
  vim.o.sessionoptions='blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
end
