do
  local FUNCTION = {}

  FUNCTION.highlights = function()
    vim.api.nvim_set_hl(0, 'OrgEndedLine', { fg = '#768390', })
    vim.api.nvim_set_hl(0, 'OrgEndedWord', { fg = '#4d9391', bold = true, })
    vim.fn.matchadd('OrgEndedLine', [[\v^\*+\s+\zsENDED.*$]])
    vim.fn.matchadd('OrgEndedLine', [[\v(^|\n)\*+\s+ENDED\_s*.*(\n\zs[^*].*)*]])
    vim.fn.matchadd('OrgEndedWord', [[\v^\*+\s+\zsENDED\ze\s+]])

    local priority_groups = {
      '@org.priority.highest',
      'OrgPriorityA',
      'OrgTSPriorityA',
    }

    for _, group in ipairs(priority_groups) do
      vim.api.nvim_set_hl(0, group, {})
    end
  end

  return FUNCTION
end
