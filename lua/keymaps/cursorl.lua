do
  local preset_cline = vim.api.nvim_get_hl(0, { name = "CursorLine" })
  local custom_cline = { bg = "#630330" }

  local use_custom = false
  local function toggle_cursor_color()
    if use_custom then
      vim.api.nvim_set_hl(0, "CursorLine", preset_cline)
    else
      vim.api.nvim_set_hl(0, "CursorLine", custom_cline)
    end
    use_custom = not use_custom
  end

  vim.keymap.set("n", "<leader><leader>", toggle_cursor_color, { desc = "Toggle cursor color" })
end
