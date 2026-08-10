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
    org_blank_before_new_entry = { heading = false, plain_list_item = false },
    win_split_mode = 'edit',
    org_todo_keywords = { 'TODO', 'NOTES', 'MOVES', '|', 'DONE' },
    org_todo_keyword_faces = {
      TODO = ':foreground "#d24b83"',
      DONE = ':foreground "#e55c7a"',
      NOTES = ':foreground "#4d9391"',
      MOVES = ':foreground "#57bfc2"',
    },
    org_log_done = 'time',
    org_priority_default = 'D',
    org_priority_highest = 'A',
    org_priority_lowest = 'D',
    org_priority_faces = {
      A = ':foreground "#ffffff',
    },
    mappings = {
      disable_all = true,
    },
    org_agenda_custom_commands = {
      n = {
        description = 'Notes',
        types = {
          {
            type = 'tags',
            match = 'TODO="NOTES"',
            org_agenda_sorting_strategy = { 'priority_down' },
          },
        },
      },
      m = {
        description = 'Moves',
        types = {
          {
            type = 'tags',
            match = 'TODO="MOVES"',
            org_agenda_sorting_strategy = { 'priority_down' },
          },
        },
      },
      k = {
        description = 'Kindle',
        types = {
          {
            type = 'tags',
            match = '+kindle',
            org_agenda_sorting_strategy = { 'priority_down' },
          },
        },
      },
      l = {
        description = 'Liquid',
        types = {
          {
            type = 'tags',
            match = '+liquid',
            org_agenda_sorting_strategy = { 'priority_down' },
          },
        },
      },
      i = {
        description = 'Inner',
        types = {
          {
            type = 'tags',
            match = '+inner',
            org_agenda_sorting_strategy = { 'priority_down' },
          },
        },
      },
      o = {
        description = 'Outer',
        types = {
          {
            type = 'tags',
            match = '+outer',
            org_agenda_sorting_strategy = { 'priority_down' },
          },
        },
      },
    },
  }
  vim.lsp.enable('org')
end
