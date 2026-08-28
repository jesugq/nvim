do
  local FUNCTION = {}

  FUNCTION.highlights = function()
    vim.api.nvim_set_hl(0, 'OrgDoneLine', { fg = '#768390' })
    vim.api.nvim_set_hl(0, "OrgDoneWord", { fg = "#4d9391", bold = true })
    vim.fn.matchadd("OrgDoneLine", [[\v^\*+\s+\zsDONE.*$]])
    vim.fn.matchadd("OrgDoneLine", [[\v(^|\n)\*+\s+DONE\_s*.*(\n\zs[^*].*)*]])
    vim.fn.matchadd("OrgDoneWord", [[\v^\*+\s+\zsDONE\ze\s+]])

    local priority_groups = {
      "@org.priority.highest",
      "OrgPriorityA",
      "OrgTSPriorityA",
    }

    for _, group in ipairs(priority_groups) do
      vim.api.nvim_set_hl(0, group, {})
    end
  end

  return FUNCTION
end
