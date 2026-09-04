do
  local FUNCTION = {}
  FUNCTION.plan = ''

  FUNCTION.md = {
    plan = 'Obsidian tags '
  }
  FUNCTION.og = {
    plan = {
      description = 'Plan',
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
    FUNCTION.md.plan = 'Obsidian tags ' .. FUNCTION.plan
    FUNCTION.og.plan.types[1].match = FUNCTION.plan
  end
  refresh()

  function FUNCTION.new_plan(plan)
    FUNCTION.plan = plan
    refresh()
  end

  function FUNCTION.get_plan()
    return FUNCTION.plan
  end

  return FUNCTION
end
