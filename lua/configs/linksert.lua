do
  local FUNCTION = {}

  FUNCTION.markdown_link = function(internal)
    local url = vim.fn.getreg('+'):gsub('^%s+', ''):gsub('%s+$', '')
    if internal then
      url = './' .. url
    end

    local row = vim.api.nvim_win_get_cursor(0)[1]
    local line = vim.api.nvim_get_current_line()
    local end_col = #line

    local text = '[](' .. url .. ')'
    vim.api.nvim_buf_set_text(0, row - 1, end_col, row - 1, end_col, { text })

    vim.api.nvim_win_set_cursor(0, { row, end_col + 1 })
    vim.cmd('startinsert')
  end

  FUNCTION.orgmode_link = function(internal)
    local url = vim.fn.getreg('+'):gsub('^%s+', ''):gsub('%s+$', '')
    if internal then
      url = './' .. url
    end

    local row = vim.api.nvim_win_get_cursor(0)[1]
    local line = vim.api.nvim_get_current_line()
    local end_col = #line

    local text = '[[' .. url .. '][]]'
    vim.api.nvim_buf_set_text(0, row - 1, end_col, row - 1, end_col, { text })

    vim.api.nvim_win_set_cursor(0, { row, end_col + #('[[' .. url .. '][') })
    vim.cmd('startinsert')
  end

  return FUNCTION
end
