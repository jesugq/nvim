---@diagnostic disable: different-requires
do
  vim.pack.add { 'https://github.com/nvimdev/dashboard-nvim' }
  require('dashboard').setup({
    theme = 'hyper',
    disable_move = true,
    shortcut_type = 'number',
    config = {
      header = {
        '',
        '   ███╗   ██╗███████╗██╗   ██╗██╗███╗   ███╗   ',
        '   ████╗  ██║██╔════╝██║   ██║██║████╗ ████║   ',
        '   ██╔██╗ ██║█████╗  ██║   ██║██║██╔████╔██║   ',
        '   ██║╚██╗██║██╔══╝  ╚██╗ ██╔╝██║██║╚██╔╝██║   ',
        '   ██║ ╚████║███████╗ ╚████╔╝ ██║██║ ╚═╝ ██║   ',
        '   ╚═╝  ╚═══╝╚══════╝  ╚═══╝  ╚═╝╚═╝     ╚═╝   ',
        '                                               ',
        '       Logo brought to you by Gemini™          ',
        '',
      },
      shortcut = {
        {
          icon = '󰩈 ',
          desc = 'What on earth is :q! ',
          group = 'DiagnosticWarn',
          action = 'qa',
          key = 'q',
        },
        {
          icon = '󰩈 ',
          desc = 'Cool afk animation ',
          group = 'Special',
          action = '! tmux new-window -n afk -- /home/jesugq/.script/afk',
          key = 'w',
        },
        {
          icon = '󰩈 ',
          desc = 'Give me back VSCode ',
          group = 'String',
          action = '! code',
          key = 'v',
        },
      },
      packages = { enable = true, },
      project = { enable = false, },
      mru = { enable = true, limit = 9, cwd_only = true, icon = '󱉊', },
      footer = {},
    },
  })
end
