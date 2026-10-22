do
  local FUNCTION = {}

  FUNCTION.section_theme = function()
    local theme = vim.deepcopy(require('lualine.themes.auto'))
    local section_color = { fg = '#eeeeee', bg = '#282828' }
    for _, mode in ipairs({ 'normal', 'insert', 'replace', 'visual', 'command', 'terminal', 'inactive' }) do
      theme[mode] = theme[mode] or {}
      theme[mode].c = vim.deepcopy(section_color)
      theme[mode].x = vim.deepcopy(section_color)
    end
    return theme
  end

  return FUNCTION
end
