do
  local is_toggled = false
  local timer = nil

  local function show_tabline(run_cmd)
    if not is_toggled then
      is_toggled = true
      vim.o.showtabline = 2
    end

    vim.cmd(run_cmd)

    if timer then
      timer:stop()
    else
      timer = vim.uv.new_timer()
    end

    timer:start(1000, 0,
      vim.schedule_wrap(function()
        vim.o.showtabline = 0
        is_toggled = false
        if timer and not timer:is_closing() then
          timer:close()
          timer = nil
        end
      end)
    )
  end

  vim.keymap.set('n', '[b', function() show_tabline('BufferLineCyclePrev') end, { desc = "Previous buffer" })
  vim.keymap.set('n', ']b', function() show_tabline('BufferLineCycleNext') end, { desc = "Next buffer" })
  vim.keymap.set("n", '<leader>b[', function() show_tabline('BufferLineMovePrev') end, { desc = "Move Buffer prev" })
  vim.keymap.set("n", '<leader>b]', function() show_tabline('BufferLineMoveNext') end, { desc = "Move Buffer next" })
end
