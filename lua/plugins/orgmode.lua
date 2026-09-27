---@diagnostic disable: different-requires
do
  local path = require('path')

  vim.pack.add { 'https://github.com/nvim-orgmode/orgmode' }
  local orgmode = require('orgmode')
  orgmode.setup {
    win_split_mode = 'edit',
    org_agenda_files = path.og_dir .. '/**/*',
    org_default_notes_file = path.og_dir .. '/@inbox.org',
    org_startup_folded = 'overview',
    org_log_done = 'time',
    org_hide_leading_stars = true,
    org_hide_emphasis_markers = true,
    org_adapt_indentation = false,
    org_blank_before_new_entry = { heading = false, plain_list_item = false, },
    org_todo_keywords = { 'LOSSY', 'FUZZY', 'SAVVY', '|', 'ENDED', },
    org_todo_keyword_faces = {
      SAVVY = ':foreground "#cf44ac"',
      FUZZY = ':foreground "#cd5ccd"',
      LOSSY = ':foreground "#a34bd2"',
      ENDED = ':foreground "#4d9391"',
    },
    org_tags_column = 0,
    org_agenda_start_on_weekday = 0,
    calendar_week_start_day = 0,
    org_deadline_warning_days = 0,
    org_priority_default = 'D',
    org_priority_highest = 'A',
    org_priority_lowest = 'D',
    mappings = {
      disable_all = true,
    },
    org_agenda_custom_commands = {
      m = {
        description = 'After',
        types = {
          {
            type = 'agenda',
            org_agenda_span = 2,
            org_agenda_sorting_strategy = { 'priority_down' },
          },
        },
      },
      n = {
        description = 'Later',
        types = {
          {
            type = 'agenda',
            org_agenda_span = 14,
            org_agenda_sorting_strategy = { 'priority_down' },
          },
        },
      },
      c = {
        description = 'Never',
        types = {
          {
            type = 'tags_todo',
            org_agenda_todo_ignore_scheduled = 'all',
            org_agenda_sorting_strategy = { 'priority_down' },
          },
        },
      },
    }
  }
  vim.lsp.enable('org')
end
