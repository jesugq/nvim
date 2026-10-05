do
  local FUNCTION = {}

  FUNCTION.deequalize = function()
    vim.api.nvim_win_set_height(0, math.floor(vim.o.lines * 0.25))
  end

  local function find_win(match)
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
      local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win)), ':t')
      if match(name) then
        return win
      end
    end
  end

  FUNCTION.open = function(file, match)
    local win = match and find_win(match)
    if win then
      vim.api.nvim_set_current_win(win)
    else
      vim.cmd('split')
      FUNCTION.deequalize()
    end
    vim.cmd.edit(vim.fn.fnameescape(file))
  end

  return FUNCTION
end
