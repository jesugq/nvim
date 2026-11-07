do
  vim.pack.add { 'https://github.com/chrisgrieser/nvim-recorder' }
  local recorder = require('recorder')
  recorder.setup {
    slots = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', },
    dynamicSlots = 'rotate',
    mapping = require('libkeys.nvim-recorder'),
    clear = false,
    logLevel = vim.log.levels.OFF,
    lessNotifications = true,
    useNerdfontIcons = true,
  }
end
