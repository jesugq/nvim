vim.keymap.set("n", "<leader>m", function()
  local uv = vim.uv or vim.loop
  local rss = uv.resident_set_memory()
  local lua_kb = collectgarbage("count")
  local rss_mb = rss / (1024 * 1024)
  local lua_mb = lua_kb / 1024
  local msg = string.format("Neovim Total: %.2f MB\nLua Plugins: %.2f MB", rss_mb, lua_mb)
  vim.notify(msg, vim.log.levels.INFO, { title = "Memory Usage" })
end, { desc = "[m]emory usage" })
