do
  local FUNCTION = {}
  local nm = ''
  local md = {}
  local og = {}

  md.inner = ''
  md.outer = ''

  og.inner = {
    description = 'Inner',
    types = {
      {
        type = 'tags',
        org_agenda_sorting_strategy = { 'priority_down' },
      },
    },
  }
  og.outer = {
    description = 'Outer',
    types = {
      {
        type = 'tags',
        org_agenda_sorting_strategy = { 'priority_down' },
      },
    },
  }

  local os_name = vim.uv.os_uname().sysname
  local host_name = vim.uv.os_gethostname()

  if os_name == 'Darwin' then
    nm = 'macos'
    md.inner = '<cmd>Obsidian tags macos<CR><cmd>'
    md.outer = '<cmd>Obsidian tags prime mated fusn poke nova<CR><cmd>'
    og.inner.types[1].match = 'macos'
    og.outer.types[1].match = 'prime|mated|fusn|poke|nova'
  elseif host_name == 'prime' then
    nm = 'prime'
    md.inner = '<cmd>Obsidian tags prime<CR><cmd>'
    md.outer = '<cmd>Obsidian tags mated macos fusn poke nova<CR><cmd>'
    og.inner.types[1].match = 'prime'
    og.outer.types[1].match = 'mated|macos|fusn|poke|nova'
  elseif host_name == 'mated' then
    nm = 'mated'
    md.inner = '<cmd>Obsidian tags mated<CR><cmd>'
    md.outer = '<cmd>Obsidian tags prime macos fusn poke nova<CR><cmd>'
    og.inner.types[1].match = 'mated'
    og.outer.types[1].match = 'prime|macos|fusn|poke|nova'
  else
    nm = 'whois'
    md.inner = '<cmd>Obsidian tags whois<CR><cmd>'
    md.outer = '<cmd>Obsidian tags prime mated macos fusn poke nova<CR><cmd>'
    og.inner.types[1].match = 'whois'
    og.outer.types[1].match = 'prime|mated|macos|fusn|poke|nova'
  end

  FUNCTION.nm = nm
  FUNCTION.md = md
  FUNCTION.og = og
  return FUNCTION
end
