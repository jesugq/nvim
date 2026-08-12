---@diagnostic disable: different-requires
do
  local path = require('path')
  local tags = require('tags')

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
    org_todo_keywords = { 'TODO', 'NUKE', 'MAKE', '|', 'REDO' },
    org_todo_keyword_faces = {
      TODO = ':foreground "#d24b83"',
      REDO = ':foreground "#e55c7a"',
      NUKE = ':foreground "#4d9391"',
      MAKE = ':foreground "#57bfc2"',
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
        description = 'Nuke',
        types = {
          {
            type = 'tags',
            match = 'TODO="NUKE"',
            org_agenda_sorting_strategy = { 'priority_down' },
          },
        },
      },
      m = {
        description = 'MAKE',
        types = {
          {
            type = 'tags',
            match = 'TODO="MAKE"',
            org_agenda_sorting_strategy = { 'priority_down' },
          },
        },
      },
      i = tags.og.inner,
      o = tags.og.outer,
    },
  }
  vim.lsp.enable('org')
end
