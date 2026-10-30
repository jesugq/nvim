do
  vim.pack.add { 'https://github.com/rktjmp/paperplanes.nvim' }
  local paperplanes = require('paperplanes')
  paperplanes.setup {
    register = '+',
    provider = 'paste.rs',
    notifier = vim.notify or print,
    save_history = true,
  }
end
