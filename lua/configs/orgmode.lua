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

    local timestamp_groups = {
      '@org.agenda.deadline',
      '@org.agenda.deadline.upcoming',
      '@org.agenda.scheduled_past',
      '@org.agenda.scheduled',
    }
    for _, group in ipairs(timestamp_groups) do
      vim.api.nvim_set_hl(0, group, { fg = '#ffffff', })
    end

    for level = 1, 8 do
      local group = ('@org.headline.level%d'):format(level)
      local highlight = level <= 6 and ('@markup.heading.%d'):format(level) or nil
      vim.api.nvim_set_hl(0, group, highlight and { link = highlight } or { fg = '#ffffff', })
    end

    if vim.bo.filetype == 'orgagenda' then
      local timestamp_labels = {
        { 'OrgAgendaDeadlineLabel', '@markup.heading.6', [[\VDeadline:]], },
        { 'OrgAgendaDeadlinePastLabel', '@markup.heading.6', [[\V1 d. ago]], },
        { 'OrgAgendaDeadlineUpcomingLabel', '@markup.heading.6', [[\vIn \d+ d\.:]], },
        { 'OrgAgendaScheduledPastLabel', '@markup.heading.5', [[\vSched\. \d+x:]], },
        { 'OrgAgendaScheduledLabel', '@markup.heading.5', [[\VScheduled:]], },
      }
      for _, label in ipairs(timestamp_labels) do
        vim.api.nvim_set_hl(0, label[1], { link = label[2], })
        vim.fn.matchadd(label[1], label[3], 200)
      end

      local cursorline = vim.api.nvim_get_hl(0, { name = 'CursorLine', link = false, })
      local background = cursorline.bg and ('#%06x'):format(cursorline.bg) or 'NONE'
      vim.api.nvim_set_hl(0, 'OrgAgendaDate', { fg = '#ffffff', bg = background, })
      vim.fn.matchadd('OrgAgendaDate', [[^\k\+\s\+\d\{1,2}\s\+\k\+\s\+\d\{4}$]], 200)
    end
  end

  return FUNCTION
end
