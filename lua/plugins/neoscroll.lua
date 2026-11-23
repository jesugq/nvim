do
  vim.pack.add { 'https://github.com/karb94/neoscroll.nvim' }
  local neoscroll = require('neoscroll')
  neoscroll.setup({
    mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb', },
    stop_eof = true,
    respect_scrolloff = true,
    cursor_scrolls_alone = true,
    duration_multiplier = 0.6,
    easing = 'linear',
  })
end
