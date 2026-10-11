do
  local function snacks_highlights(hl, colors)
    local float = hl.get('NormalFloat')

    -- Picker: same roles as before, brighter equivalents
    hl.set('SnacksPickerMatch', { fg = colors.ui_yellow, style = { bold = true } })
    hl.set('SnacksPickerDir', { fg = colors.functions })
    hl.set('SnacksPickerFile', { fg = colors.fg })
    hl.set('SnacksPickerDirectory', { fg = colors.ui_blue })
    hl.set('SnacksPickerBorder', { fg = colors.fg4, bg = float.bg })
    hl.set('SnacksPickerInputBorder', { fg = colors.ui_orange, bg = float.bg })
    hl.set('SnacksPickerTitle', { fg = colors.ui_blue, bg = float.bg })
    hl.set('SnacksPickerBoxTitle', { link = 'SnacksPickerTitle' })
    hl.set('SnacksPickerInputTitle', { link = 'SnacksPickerTitle' })
    hl.set('SnacksPickerPrompt', { fg = colors.ui_orange })
    hl.set('SnacksPickerSelected', { fg = colors.main_keywords })
    hl.set('SnacksPickerListCursorLine', {
      bg = colors.bg:with_overlay(colors.ui_blue, 25),
    })
    hl.set('SnacksPickerTotals', { fg = colors.fg4 })

    -- Dashboard
    hl.set('SnacksDashboardTitle', { fg = colors.ui_blue })
    hl.set('SnacksDashboardHeader', { fg = colors.ui_blue })
    hl.set('SnacksDashboardIcon', { fg = colors.ui_blue })
    hl.set('SnacksDashboardDesc', { fg = colors.fg2 })
    hl.set('SnacksDashboardKey', { fg = colors.ui_orange })
    hl.set('SnacksDashboardFooter', { fg = colors.fg4 })
    hl.set('SnacksDashboardDir', { fg = colors.functions })
    hl.set('SnacksDashboardSpecial', { fg = colors.ui_yellow })

    -- Notifier
    local levels = {
      Info = colors.ui_blue,
      Warn = colors.ui_orange,
      Error = colors.ui_red,
      Debug = colors.ui_purple,
      Trace = colors.ui_yellow,
    }
    for level, color in pairs(levels) do
      hl.set('SnacksNotifierBorder' .. level, { fg = color })
      hl.set('SnacksNotifierIcon' .. level, { fg = color })
      hl.set('SnacksNotifierTitle' .. level, { fg = color })
      hl.set('SnacksNotifierFooter' .. level, { fg = color })
    end

    -- Input
    hl.set('SnacksInputBorder', { fg = colors.ui_orange, bg = float.bg })
    hl.set('SnacksInputTitle', { fg = colors.ui_blue })
    hl.set('SnacksInputIcon', { fg = colors.ui_purple })
  end

  vim.pack.add { 'https://github.com/ramojus/mellifluous.nvim' }
  require('mellifluous').setup {
    colorset = 'tender',
    highlight_overrides = {
      dark = snacks_highlights,
      light = snacks_highlights,
    },
  }
  vim.cmd.colorscheme 'mellifluous'
end
