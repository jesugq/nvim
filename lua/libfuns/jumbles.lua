do
  local FUNCTION = {}

  FUNCTION.wrap_jumble = function()
    local new_state = not vim.o.wrap

    vim.o.wrap = new_state
    vim.o.linebreak = new_state

    for _, win in ipairs(vim.api.nvim_list_wins()) do
      vim.api.nvim_set_option_value('wrap', new_state, { win = win })
      vim.api.nvim_set_option_value('linebreak', new_state, { win = win })
    end
  end

  FUNCTION.number_jumble = function()
    vim.opt.relativenumber = not vim.opt.relativenumber:get()
  end

  return FUNCTION
end
