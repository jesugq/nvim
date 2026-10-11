do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'org',
    callback = function()
      require('configs.orgmode').highlights()
    end,
  })

  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'orgagenda',
    callback = function()
      require('configs.orgmode').highlights()
    end,
  })
end
