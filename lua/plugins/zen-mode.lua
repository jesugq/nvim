do
  vim.pack.add { 'https://github.com/folke/zen-mode.nvim' }
  local zen_mode = require('zen-mode')
  zen_mode.setup {
    on_open = function()
      vim.api.nvim_exec_autocmds('User', { pattern = 'ZenMode', })
    end,
  }
end
