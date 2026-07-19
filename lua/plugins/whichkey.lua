do
  vim.pack.add { 'https://github.com/folke/which-key.nvim' }
  local which_key = require('which-key')

  which_key.setup {
    delay = 500,
    icons = { mappings = true },
    spec = { },
  }
  which_key.add({
    { "<leader>b", group = "Buffer" },
    { "<leader>f", group = "File" },
    { "<leader>h", group = "Hunk" },
    { "<leader>q", group = "Quit" },
    { "<leader>s", group = "Search" },
    { "<C-w>c", hidden = true },
    { "gO", hidden = true },
  })
end
