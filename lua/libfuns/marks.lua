do
  local FUNCTION = {}

  FUNCTION.toggle_mark = function()
    require('marks').toggle()
    vim.cmd('normal! j')
  end

  FUNCTION.toggle_mark_up = function()
    require('marks').toggle()
    vim.cmd('normal! k')
  end

  return FUNCTION
end
