do
  local last_leaders = nil
  local prev_session = nil

  local function this_session()
    if vim.v.this_session == "" then
      return vim.fn.getcwd()
    end
    local name = vim.fn.fnamemodify(vim.v.this_session, ":t:r")
    name = string.gsub(name, "%%(%x%x)", function(hex)
      return string.char(tonumber(hex, 16))
    end)
    return name
  end

  local function last_session()
    local current = this_session()
    if prev_session then
      vim.cmd('AutoSession save')
      vim.api.nvim_cmd({
        cmd = 'AutoSession',
        args = { 'restore', prev_session }
      }, {})
      prev_session = current
    else
      vim.notify('None', vim.log.levels.WARN)
    end
  end

  local function find_session()
    local current = this_session()
    if current then
      prev_session = current
    end
    vim.cmd('AutoSession save')
    vim.cmd('AutoSession search')
  end

  local function last_buffer()
    vim.cmd('b #')
  end

  local function last_window()
    local current = vim.api.nvim_get_current_win()
    local previous = vim.fn.win_getid(vim.fn.winnr('#'))
    local same_tab = previous ~= 0
        and vim.api.nvim_win_is_valid(previous)
        and vim.api.nvim_win_get_tabpage(previous) == vim.api.nvim_get_current_tabpage()

    if same_tab and previous ~= current then
      vim.api.nvim_set_current_win(previous)
    else
      vim.cmd('wincmd w')
    end
  end

  -- <leader><leader>
  vim.keymap.set('n', '<leader><leader>', function()
    if last_leaders == 'session' then
      last_session()
    elseif last_leaders == 'buffer' then
      last_buffer()
    elseif last_leaders == 'window' then
      last_window()
    else
      vim.notify('None', vim.log.levels.WARN)
    end
  end, { desc = 'Leader last' })

  -- <leader>o
  vim.keymap.set('n', '<leader>oo', function()
    last_leaders = 'session'
    last_session()
  end, { desc = 'Session last' })
  vim.keymap.set('n', '<leader>of', function()
    find_session()
  end, { desc = 'Session find' })

  -- <leader>b
  vim.keymap.set('n', '<leader>bb', function()
    last_leaders = 'buffer'
    last_buffer()
  end, { desc = 'Buffer last' })

  -- <leader>w
  vim.keymap.set('n', '<leader>ww', function()
    last_leaders = 'window'
    last_window()
  end, { desc = 'Window last' })
end
