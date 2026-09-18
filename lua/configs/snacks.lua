do
  local FUNCTION = {}

  FUNCTION.incoming_links = function()
    Snacks.picker.grep({
      search = vim.uri_encode(vim.fn.expand('%:.')),
      regex = false,
    })
  end

  FUNCTION.outgoing_links = function()
    Snacks.picker.lines({
      pattern = '](',
      layout = { preset = 'default', preview = true },
    })
  end

  return FUNCTION
end
