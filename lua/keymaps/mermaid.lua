do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'mermaid',
    callback = function()
      local buf = vim.api.nvim_get_current_buf()
      vim.keymap.set('n', '<leader>np', '<cmd>MermaidPreview<CR>',
        { buffer = buf, desc = 'Mermaid Preview' })
      vim.keymap.set('n', '<leader>nf', '<cmd>MermaidFormat<CR>',
        { buffer = buf, desc = 'Mermaid Format' })
      vim.keymap.set('n', '<leader>nc', '<cmd>MermaidCopyURL<CR>',
        { buffer = buf, desc = 'Mermaid Copy URL' })
      vim.keymap.set('n', '<leader>nz', '<cmd>MermaidPreviewStop<CR>',
        { buffer = buf, desc = 'Mermaid Stop Preview' })
    end,
  })
end
