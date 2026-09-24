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
    org_adapt_indentation = false,
    org_use_tag_inheritance = false,
    org_blank_before_new_entry = { heading = false, plain_list_item = false, },
    win_split_mode = 'edit',
    org_tags_column = 0,
    org_todo_keywords = { 'LOSSY', 'FUZZY', 'SAVVY', '|', 'ENDED', },
    org_todo_keyword_faces = {
      SAVVY = ':foreground "#cf44ac"',
      FUZZY = ':foreground "#cd5ccd"',
      LOSSY = ':foreground "#a34bd2"',
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
        description = 'Began',
        types = {
          {
            type = 'tags',
            match = '+SCHEDULED<="<today>"&-TODO="ENDED"',
            org_agenda_sorting_strategy = { 'priority_down', },
          },
        },
      },
      n = {
        description = 'Ended',
        types = {
          {
            type = 'tags',
            match = '+SCHEDULED<="<today>"&+TODO="ENDED"',
            org_agenda_sorting_strategy = { 'priority_down', },
          },
        },
      },
      c = {
        description = 'Tasks',
        types = {
          {
            type = 'tags',
            match = '+TODO="SAVVY"|+TODO="FUZZY"|+TODO="LOSSY"',
            org_agenda_sorting_strategy = { 'priority_down', },
          },
        },
      },
    },
  }
  vim.lsp.enable('org')
end
