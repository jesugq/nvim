do
  local FUNCTION = {}

  FUNCTION.add_session = function()
    Snacks.input({ prompt = 'Session name' },
      function(input)
        if input and input ~= '' then
          vim.cmd('AutoSession save ' .. input)
        end
      end
    )
  end

  return FUNCTION
end
