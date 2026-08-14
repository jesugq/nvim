do
  local function current_date()
    return os.date("%Y-%m-%d")
  end

  local function local_marks()
    local buf = vim.api.nvim_get_current_buf()
    local marks = {}

    for i = string.byte('a'), string.byte('z') do
      local char = string.char(i)
      local pos = vim.api.nvim_buf_get_mark(buf, char)

      if pos[1] > 0 then
        table.insert(marks, char)
      end
    end

    return table.concat(marks, ' ')
  end

  local function global_marks()
    local buf = vim.api.nvim_get_current_buf()
    local marks = {}

    for i = string.byte('A'), string.byte('Z') do
      local char = string.char(i)
      local pos = vim.api.nvim_buf_get_mark(buf, char)

      if pos[1] > 0 then
        table.insert(marks, char)
      end
    end

    return table.concat(marks, ' ')
  end

  vim.pack.add { 'https://github.com/nvim-lualine/lualine.nvim' }
  require('lualine').setup {
    options = {
      icons_enabled = true,
      always_divide_middle = true,
      globalstatus = true,
    },
    winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename', { local_marks }, { global_marks }, 'diff', 'diagnostics' },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    inactive_winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename', { local_marks }, { global_marks }, 'diff', 'diagnostics' },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    sections = {
      lualine_a = {},
      lualine_b = { 'mode', 'searchcount', 'selectioncount' },
      lualine_c = { 'branch' },
      lualine_x = { 'lsp_status'},
      lualine_y = { { current_date } },
      lualine_z = {},
    },
  }
end
