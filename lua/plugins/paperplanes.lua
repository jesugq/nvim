do
  vim.pack.add { 'https://github.com/rktjmp/paperplanes.nvim' }
  local paperplanes = require('paperplanes')
  paperplanes.setup {
    register = '+',
    provider = 'dpaste.org',
    notifier = vim.notify or print,
    save_history = true,
  }
end
