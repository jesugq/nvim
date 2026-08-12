do
  local is_toggled = false
  local timer = nil

  local function fancy_navigate(direction)
    local buffertabs = require('buffertabs')

    if not is_toggled then
      is_toggled = true
      buffertabs.toggle()
    end

    if direction == 'next' then
      vim.cmd('bnext')
    elseif direction == 'prev' then
      vim.cmd('bprevious')
    end

    if timer then
      timer:stop()
    else
      timer = vim.uv.new_timer()
    end

    timer:start(1000, 0,
      vim.schedule_wrap(function()
        buffertabs.toggle()
        is_toggled = false
        if timer and not timer:is_closing() then
          timer:close()
          timer = nil
        end
      end)
    )
  end

  vim.keymap.set('n', '[b', function() fancy_navigate('prev') end, { silent = true, desc = "Previous buffer" })
  vim.keymap.set('n', ']b', function() fancy_navigate('next') end, { silent = true, desc = "Next buffer" })
end
