do
  local function current_date()
    return os.date('%Y-%m-%d')
  end

  local function last_buffer()
    local win = vim.g.statusline_winid
    if not win or not vim.api.nvim_win_is_valid(win) then
      win = vim.api.nvim_get_current_win()
    end

    local buf = vim.api.nvim_win_call(win, function()
      return vim.fn.bufnr('#')
    end)
    if buf < 1 or not vim.api.nvim_buf_is_valid(buf) then
      return ''
    end

    local name = vim.api.nvim_buf_get_name(buf)
    return name ~= '' and vim.fn.fnamemodify(name, ':t') or '[No Name]'
  end

  vim.pack.add { 'https://github.com/nvim-lualine/lualine.nvim' }

  local lualine = require('lualine')
  lualine.setup {
    options = {
      icons_enabled = true,
      always_divide_middle = true,
      globalstatus = true,
      theme = 'gruvbox-material',
    },
    winbar = {
      lualine_a = { { 'filename', path = 1 }, },
      lualine_b = { 'diff', 'diagnostics', },
      lualine_c = {},
      lualine_x = {},
      lualine_y = { last_buffer, },
      lualine_z = {},
    },
    inactive_winbar = {
      lualine_a = { 'filename', },
      lualine_b = { 'diff', 'diagnostics', },
      lualine_c = {},
      lualine_x = {},
      lualine_y = { last_buffer, },
      lualine_z = {},
    },
    sections = {
      lualine_a = { 'mode', 'searchcount', 'selectioncount', },
      lualine_b = { 'branch', },
      lualine_c = {},
      lualine_x = {},
      lualine_y = { 'lsp_status', },
      lualine_z = { current_date, },
    },
  }
end
