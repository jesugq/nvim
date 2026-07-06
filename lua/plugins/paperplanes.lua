do
  vim.pack.add { 'https://github.com/rktjmp/paperplanes.nvim' }
  require('paperplanes').setup {
    register = '+',
    provider = 'paste.rs',
    notifier = vim.notify or print,
    save_history = true,
  }
end
