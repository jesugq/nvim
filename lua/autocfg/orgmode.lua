do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'org',
    callback = function()
      vim.api.nvim_set_hl(0, '@org.priority.highest', { fg = '#d6224d', bold = true })

      vim.api.nvim_set_hl(0, 'OrgPriorityA', { fg = '#d6224d', bold = true })
      vim.api.nvim_set_hl(0, 'OrgPriorityB', { fg = '#e121b1', bold = true })
      vim.api.nvim_set_hl(0, 'OrgPriorityC', { fg = '#ab33eb', bold = true })
      vim.api.nvim_set_hl(0, 'OrgPriorityD', { fg = '#554af5', bold = true })

      vim.fn.matchadd('OrgPriorityA', [=[\[#A\]]=])
      vim.fn.matchadd('OrgPriorityB', [=[\[#B\]]=])
      vim.fn.matchadd('OrgPriorityC', [=[\[#C\]]=])
      vim.fn.matchadd('OrgPriorityD', [=[\[#D\]]=])
    end,
  })
end

