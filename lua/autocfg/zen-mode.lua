local fillchars = require('libfuns.fillchars')

vim.api.nvim_create_autocmd('User', {
  pattern = 'ZenMode',
  callback = function()
    fillchars.highlights()
  end,
})

vim.api.nvim_create_autocmd('BufWinEnter', {
  callback = function()
    local view = require('zen-mode.view')
    if view.is_open() and vim.api.nvim_get_current_win() == view.win then
      vim.schedule(fillchars.highlights)
    end
  end,
})
