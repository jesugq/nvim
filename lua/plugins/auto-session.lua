---@diagnostic disable: different-requires
do
  vim.pack.add { 'https://github.com/rmagatti/auto-session' }
  require('auto-session').setup {
    auto_create = false,
    auto_save_enabled = false,
    close_unsupported_windows = true,
    post_restore_cmds = {
      function()
        local session_name = require('auto-session.lib').current_session_name()

        vim.notify(tostring(session_name), vim.log.levels.INFO, {
          title = 'Auto Session',
        })
      end,
    },
    no_restore_cmds = {
      function()
        vim.notify('None', vim.log.levels.INFO, {
          title = 'Auto Session',
        })
      end,
    },
  }
  vim.o.sessionoptions='blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
end
