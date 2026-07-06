do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'org',
    callback = function()
      vim.api.nvim_set_hl(0, "Folded", { fg = "#1a1b25", bg = "#1a1b25", italic = false })
    end,
  })
end
