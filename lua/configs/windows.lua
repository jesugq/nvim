do
  local FUNCTION = {}

  FUNCTION.deequalize = function()
    vim.api.nvim_win_set_height(0, math.floor(vim.o.lines * 0.20))
  end

  return FUNCTION
end
