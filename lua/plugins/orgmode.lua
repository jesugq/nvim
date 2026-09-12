---@diagnostic disable: different-requires
do
  local path = require('path')

  vim.pack.add { 'https://github.com/nvim-orgmode/orgmode' }
  local orgmode = require('orgmode')
  orgmode.setup {
    org_agenda_files = path.og_dir .. '/**/*',
    org_default_notes_file = path.og_dir .. '/@inbox.org',
    org_startup_folded = 'overview',
    org_hide_leading_stars = true,
    org_hide_emphasis_markers = true,
    org_use_tag_inheritance = false,
    org_blank_before_new_entry = { heading = false, plain_list_item = false, },
    win_split_mode = 'edit',
    org_tags_column = 0,
    org_todo_keywords = { 'TODAY', 'AFTER', 'LATER', 'NEVER', '|', 'ENDED', },
    org_todo_keyword_faces = {
      TODAY = ':foreground "#d24b83"',
      AFTER = ':foreground "#cf44ac"',
      LATER = ':foreground "#cd5ccd"',
      NEVER = ':foreground "#a34bd2"',
      ENDED = ':foreground "#4d9391"',
    },
    org_log_done = 'time',
    org_priority_default = 'D',
    org_priority_highest = 'A',
    org_priority_lowest = 'D',
    mappings = {
      disable_all = true,
    },
    org_agenda_custom_commands = {
      m = {
        description = 'Today',
        types = {
          {
            type = 'tags',
            match = 'TODO="TODAY"',
            org_agenda_sorting_strategy = { 'priority_down', },
          },
        },
      },
      n = {
        description = 'After',
        types = {
          {
            type = 'tags',
            match = 'TODO="AFTER"',
            org_agenda_sorting_strategy = { 'priority_down', },
          },
        },
      },
      b = {
        description = 'Later',
        types = {
          {
            type = 'tags',
            match = 'TODO="LATER"',
            org_agenda_sorting_strategy = { 'priority_down', },
          },
        },
      },
      v = {
        description = 'Never',
        types = {
          {
            type = 'tags',
            match = 'TODO="NEVER"',
            org_agenda_sorting_strategy = { 'priority_down', },
          },
        },
      },
    },
  }
  vim.lsp.enable('org')
end
