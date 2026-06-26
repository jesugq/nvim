do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'org',
    callback = function()
      vim.api.nvim_set_hl(0, "Folded", { fg = "#1a1b25", bg = "#1a1b25", italic = false })
    end,
  })

  vim.pack.add { 'https://github.com/nvim-orgmode/orgmode' }
  require('orgmode').setup {
    org_agenda_files = '~/Sync/Apps/Orgmode/**/*',
    -- org_agenda_files = '~/Development/orgmode/**/*',
    org_default_notes_file = '~/Sync/Apps/Orgmode/@inbox.org',
    -- org_default_notes_file = '~/Development/orgmode/@inbox.org',
    org_startup_folded = 'overview',
    org_hide_leading_stars = true,
    org_hide_emphasis_markers = true,
    org_blank_before_new_entry = { heading = false, plain_list_item = false },
    win_split_mode = 'edit',
    org_todo_keywords = { 'TODO', 'QUERY', 'FUZZY', 'READY', '|', 'DONE' },
    org_todo_keyword_faces = {
      QUERY = ':foreground "#4d9391"',
      FUZZY = ':foreground "#47ba99"',
      READY = ':foreground "#57bfc2"',
    },
    org_log_done = 'time',
    org_priority_default = 'C',
    org_priority_highest = 'A',
    org_priority_lowest = 'C',
    org_priority_faces = {
      A = ':foreground "#ffffff',
    },
    mappings = {
      disable_all = true,
    },
    org_agenda_custom_commands = {
      c = {
        description = 'Coder',
        types = {
          {
            type = 'tags_todo',
            match = '+coder',
            org_agenda_overriding_header = 'By tags coder',
            org_agenda_sorting_strategy = { 'priority_down' },
          },
        },
      },
      h = {
        description = 'Higher',
        types = {
          {
            type = 'tags_todo',
            match = 'PRIORITY="A"',
            org_agenda_overriding_header = 'By prio higher',
            org_agenda_sorting_strategy = { 'todo-state-down' },
          },
        },
      },
      r = {
        description = 'Ready',
        types = {
          {
            type = 'tags_todo',
            match = 'TODO="READY"',
            org_agenda_overriding_header = 'By face ready',
            org_agenda_sorting_strategy = { 'priority_down' },
          },
        },
      },
      f = {
        description = 'Fuzzy',
        types = {
          {
            type = 'tags',
            match = 'TODO="FUZZY"',
            org_agenda_overriding_header = 'By face fuzzy',
            org_agenda_sorting_strategy = { 'priority_down' },
          },
        },
      },
      a = {
        description = 'Agenda',
        types = {
          {
            type = 'agenda',
            org_agenda_span = 7,
            org_agenda_overriding_header = 'By default agenda',
          },
        },
      },
    },
  }
  vim.api.nvim_set_hl(0, '@org.priority.highest', { fg = '#d6224d', bold = true })
  vim.api.nvim_set_hl(0, '@org.priority.high', { fg = '#e121b1', bold = true })
  vim.api.nvim_set_hl(0, '@org.priority.lowest', { fg = '#ab33eb', bold = true })
  vim.api.nvim_set_hl(0, '@org.priority.default', { fg = '#000000', bold = true })
end
