do
  local path = require('../path')

  vim.pack.add { 'https://github.com/nvim-orgmode/orgmode' }
  require('orgmode').setup {
    org_agenda_files = path.org_dir .. '/**/*',
    org_startup_folded = 'overview',
    org_hide_leading_stars = true,
    org_hide_emphasis_markers = true,
    org_use_tag_inheritance = false,
    org_blank_before_new_entry = { heading = false, plain_list_item = false },
    win_split_mode = 'edit',
    org_todo_keywords = { 'TODO', 'REVIEW', 'RESUME', '|', 'DONE' },
    org_todo_keyword_faces = {
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
        description = 'Agenda',
        types = {
          {
            type = 'agenda',
            org_agenda_span = 8,
            org_agenda_tag_filter_preset = '-A',
          },
        },
      },
      s = {
        description = 'Signal',
        types = {
          {
            type = 'agenda',
            org_agenda_span = 15,
            org_agenda_tag_filter_preset = '+A',
          },
        },
      },
      w = {
        description = 'Review',
        types = {
          {
            type = 'tags_todo',
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
            type = 'tags_todo',
            match = '+oled',
            org_agenda_sorting_strategy = { 'priority_down' },
          },
        },
      },
      i = {
        description = 'Inkd',
        types = {
          {
            type = 'tags_todo',
            match = '+inkd',
            org_agenda_sorting_strategy = { 'priority_down' },
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
