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
        '',
        '',
        '                ███╗   ██╗ ██████╗     ███    ███ ███████                   ',
        '                ████╗  ██║██╔═══██╗    ████  ████ ██                        ',
        '                ██╔██╗ ██║██║   ██║    ██ ████ ██ █████                     ',
        '                ██║╚██╗██║██║   ██║    ██  ██  ██ ██                        ',
        '                ██║ ╚████║╚██████╔╝    ██      ██ ███████                   ',
        '                ╚═╝  ╚═══╝ ╚═════╝                                          ',
        '                                                                            ',
        '███    ███ ███████ ████████  █████  ███    ██      ██████╗  ██████╗ ██╗     ',
        '████  ████ ██         ██    ██   ██ ████   ██     ██╔════╝ ██╔═══██╗██║     ',
        '██ ████ ██ █████      ██    ███████ ██ ██  ██     ██║  ███╗██║   ██║██║     ',
        '██  ██  ██ ██         ██    ██   ██ ██  ██ ██     ██║   ██║██║   ██║██║     ',
        '██      ██ ███████    ██    ██   ██ ██   ████     ╚██████╔╝╚██████╔╝███████╗',
        '                                                   ╚═════╝  ╚═════╝ ╚══════╝',
        '                                                                            ',
        '    ██████╗  ██████╗ ██████╗   ███████  █████  ██    ██  ██████  ██████     ',
        '    ██╔══██╗██╔═══██╗██╔══██╗  ██      ██   ██ ██    ██ ██    ██ ██   ██    ',
        '    ██████╔╝██║   ██║██████╔╝  █████   ███████ ██    ██ ██    ██ ██████     ',
        '    ██╔═══╝ ██║   ██║██╔══██╗  ██      ██   ██  ██  ██  ██    ██ ██   ██    ',
        '    ██║     ╚██████╔╝██║  ██║  ██      ██   ██   ████    ██████  ██   ██    ',
        '    ╚═╝      ╚═════╝ ╚═╝  ╚═╝                                               ',
        '',
      },
      shortcut = {
        {
          icon = ' ',
          desc = ' How do I exit vim? ',
          group = 'DiagnosticWarn',
          action = 'qa',
          key = 'q',
        },
        {
          icon = ' ',
          desc = ' Cool afk animation ',
          group = 'Special',
          action = '! tmux new-window -n afk -- "$HOME/.script/afk"',
          key = 'A',
        },
        {
          icon = '󰭙 ',
          desc = ' WTF is this Jesus ',
          group = 'String',
          action = function()
           vim.ui.open("https://www.youtube.com/watch?v=c4OyfL5o7DU")
          end,
          key = 'w',
        },
      },
      packages = { enable = true, },
      project = { enable = false, },
      mru = { enable = false, },
      footer = {},
    },
  })
end
