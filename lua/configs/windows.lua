do
  local FUNCTION = {}

  FUNCTION.deequalize = function()
    vim.api.nvim_win_set_height(0, math.floor(vim.o.lines * 0.20))
  end

  FUNCTION.toggle_prompt = function()
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
      local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win)), ':t')
      if name == 'prompt' or name == 'prompt.md' then
        vim.api.nvim_win_close(win, false)
        return
      end
    end
    vim.cmd('split')
    FUNCTION.deequalize()
    vim.cmd('e prompt')
  end

  return FUNCTION
end
