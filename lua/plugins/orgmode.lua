---@diagnostic disable: different-requires
do
  local path = require('path')

  vim.pack.add { 'https://github.com/nvim-orgmode/orgmode' }
  local orgmode = require('orgmode')
  orgmode.setup {
    org_agenda_files = path.og_dir .. '/**/*',
    org_startup_folded = 'overview',
    org_hide_leading_stars = true,
    org_hide_emphasis_markers = true,
    org_use_tag_inheritance = false,
    org_blank_before_new_entry = { heading = false, plain_list_item = false },
    win_split_mode = 'edit',
    org_todo_keywords = { 'TODO', 'REVIEW', 'RESUME', '|', 'DONE' },
    org_todo_keyword_faces = {
      TODO = ':foreground "#d24b83"',
      DONE = ':foreground "#e55c7a"',
      REVIEW = ':foreground "#4d9391"',
      RESUME = ':foreground "#57bfc2"',
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
      a = {
        description = 'Action',
        types = {
          {
            type = 'agenda',
            org_agenda_span = 15,
            org_agenda_tag_filter_preset = '+A',
          },
        },
      },
      s = {
        description = 'Signal',
        types = {
          {
            type = 'agenda',
            org_agenda_span = 15,
            org_agenda_tag_filter_preset = '-A',
          },
        },
      },
      w = {
        description = 'Review',
        types = {
          {
            type = 'tags',
            match = 'TODO="REVIEW"',
            org_agenda_sorting_strategy = { 'priority_down' },
          },
        },
      },
      e = {
        description = 'Resume',
        types = {
          {
            type = 'tags',
            match = 'TODO="RESUME"',
            org_agenda_sorting_strategy = { 'priority_down' },
          },
        },
      },
      o = {
        description = 'Oled',
        types = {
          {
            type = 'tags',
            match = '+oled',
            org_agenda_sorting_strategy = { 'priority_down' },
          },
        },
      },
      i = {
        description = 'Inkd',
        types = {
          {
            type = 'tags',
            match = '+inkd',
            org_agenda_sorting_strategy = { 'priority_down' },
          },
        },
      },
    },
  }
  vim.lsp.enable('org')
end
