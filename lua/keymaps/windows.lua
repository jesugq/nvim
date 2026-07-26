do
  local function resize(size)
    size = size or 75
    local ratio = size / 100

    local original_cmdheight = vim.o.cmdheight

    local total_cols = vim.o.columns
    local total_lines = vim.o.lines - original_cmdheight - (vim.o.laststatus > 0 and 1 or 0)

    local target_cols = math.floor(total_cols * ratio)
    local target_lines = math.floor(total_lines * ratio)

    pcall(vim.api.nvim_win_set_width, 0, target_cols)
    pcall(vim.api.nvim_win_set_height, 0, target_lines)

    vim.o.cmdheight = original_cmdheight
  end

  vim.keymap.set('n', '<C-w>c', '<Nop>', { desc = 'Close current window' })
  vim.keymap.set('n', '<C-w>x', '<C-w>c', { remap = false, desc = 'Close current window' })
  vim.keymap.set('n', '<C-w>-', function() resize(75) end, { desc = 'Expand current window' })

  vim.keymap.set('n', '<C-w>H', '<Nop>', { desc = 'Move window left' })
  vim.keymap.set('n', '<C-w>J', '<Nop>', { desc = 'Move window down' })
  vim.keymap.set('n', '<C-w>K', '<Nop>', { desc = 'Move window up' })
  vim.keymap.set('n', '<C-w>L', '<Nop>', { desc = 'Move window right' })
  vim.keymap.set('n', '<C-w>h', '<C-w>H', { remap = false, desc = 'Move window left' })
  vim.keymap.set('n', '<C-w>j', '<C-w>J', { remap = false, desc = 'Move window down' })
  vim.keymap.set('n', '<C-w>k', '<C-w>K', { remap = false, desc = 'Move window up' })
  vim.keymap.set('n', '<C-w>l', '<C-w>L', { remap = false, desc = 'Move window right' })
end
