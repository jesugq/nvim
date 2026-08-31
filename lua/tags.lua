do
  local FUNCTION = {}
  FUNCTION.tag = ''

  FUNCTION.md = 'Obsidian tags '
  FUNCTION.og = {
    tag_search = {
      description = 'Tag Search',
      types = {
        {
          type = 'tags',
          match = '',
          org_agenda_sorting_strategy = { 'priority_down' },
        },
      },
    },
  }

  local function refresh()
    FUNCTION.md = 'Obsidian tags ' .. FUNCTION.tag
    FUNCTION.og.tag_search.types[1].match = FUNCTION.tag
  end
  refresh()

  function FUNCTION.new_tag(tag)
    FUNCTION.tag = tag
    refresh()
  end

  return FUNCTION
end
