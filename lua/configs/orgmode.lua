do
  local FUNCTION = {}

  FUNCTION.highlights = function()
    vim.api.nvim_set_hl(0, 'OrgRedoLine', { fg = '#768390' })
    vim.api.nvim_set_hl(0, "OrgRedoWord", { fg = "#4d9391", bold = true })
    vim.fn.matchadd("OrgRedoLine", [[\v^\*+\s+\zsREDO.*$]])
    vim.fn.matchadd("OrgRedoLine", [[\v(^|\n)\*+\s+REDO\_s*.*(\n\zs[^*].*)*]])
    vim.fn.matchadd("OrgRedoWord", [[\v^\*+\s+\zsREDO\ze\s+]])

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
