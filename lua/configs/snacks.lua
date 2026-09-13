do
  local FUNCTION = {}

  FUNCTION.incoming_links = function()
    Snacks.picker.grep({
      search = vim.uri_encode(vim.fn.expand('%:.')),
      regex = false,
      focus = 'list',
    })
  end

  FUNCTION.outgoing_links = function()
    Snacks.picker.lines({
      pattern = '](',
      layout = { preset = 'default', preview = true },
      focus = 'list',
    })
  end

  return FUNCTION
end
