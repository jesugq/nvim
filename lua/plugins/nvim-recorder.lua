do
  vim.pack.add { 'https://github.com/chrisgrieser/nvim-recorder' }
  require('recorder').setup {
    slots = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' },
    dynamicSlots = 'rotate',
    mapping = require('keymaps.nvim-recorder'),
    clear = false,
    logLevel = vim.log.levels.INFO,
    lessNotifications = false,
    useNerdfontIcons = true,
  }
end
