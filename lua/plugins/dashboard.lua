---@diagnostic disable: different-requires
do
  vim.pack.add { 'https://github.com/nvimdev/dashboard-nvim' }
  require('dashboard').setup({
    theme = 'hyper',
    disable_move = true,
    shortcut_type = 'number',
    config = {
      header = {
        "",
        "   ███╗   ██╗███████╗██╗   ██╗██╗███╗   ███╗   ",
        "   ████╗  ██║██╔════╝██║   ██║██║████╗ ████║   ",
        "   ██╔██╗ ██║█████╗  ██║   ██║██║██╔████╔██║   ",
        "   ██║╚██╗██║██╔══╝  ╚██╗ ██╔╝██║██║╚██╔╝██║   ",
        "   ██║ ╚████║███████╗ ╚████╔╝ ██║██║ ╚═╝ ██║   ",
        "   ╚═╝  ╚═══╝╚══════╝  ╚═══╝  ╚═╝╚═╝     ╚═╝   ",
        "                                               ",
        "       Logo brought to you by Gemini™          ",
        "",
      },
      shortcut = {
        {
          icon = ' ',
          desc = 'Buffers',
          group = 'Label',
          action = function() Snacks.picker.buffers() end,
          key = 'w',
        },
        {
          icon = '󱫬 ',
          desc = 'Recent',
          group = 'Function',
          action = function() Snacks.picker.recent() end,
          key = 'r',
        },
        {
          icon = '󰈞 ',
          desc = 'Files',
          group = 'Special',
          action = function() Snacks.picker.files() end,
          key = 'f',
        },
        {
          icon = '󱤇 ',
          desc = 'Grep',
          group = 'String',
          action = function() Snacks.picker.grep() end,
          key = 'g',
        },
        {
          icon = '󰩈 ',
          desc = "Devin, take the wheel",
          group = 'DiagnosticWarn',
          action = 'qa',
          key = 'q',
        },
      },
      packages = { enable = true },
      project = { enable = false },
      mru = { enable = true, limit = 9, cwd_only = true, icon = '󱉊' },
      footer = {},
    },
  })
end
