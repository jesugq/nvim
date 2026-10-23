do
  local FUNCTION = {}
  local staged = {}
  local pending = {}

  local function collect_marks()
    local marks = {}
    local seen = {}

    local function add(mark, fallback)
      local label = mark.mark and mark.mark:sub(2, 2)
      if not label or not label:match('^%a$') then
        return
      end
      local file = (mark.file and mark.file ~= '') and mark.file or fallback or ''
      if file == '' or not mark.pos or mark.pos[2] == 0 then
        return
      end
      file = vim.fn.fnamemodify(vim.fn.expand(file), ':p')
      local key = label .. file
      if seen[key] then
        return
      end
      seen[key] = true
      marks[#marks + 1] = {
        name = label,
        file = file,
        line = mark.pos[2],
        col = mark.pos[3],
      }
    end

    for _, mark in ipairs(vim.fn.getmarklist()) do
      add(mark)
    end
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_loaded(bufnr) then
        local name = vim.api.nvim_buf_get_name(bufnr)
        for _, mark in ipairs(vim.fn.getmarklist(bufnr)) do
          add(mark, name)
        end
      end
    end
    return marks
  end

  local function place(mark, bufnr)
    vim.fn.setpos("'" .. mark.name, { bufnr, mark.line, mark.col, 0 })
  end

  local function refresh_visible_marks()
    local ok, marks = pcall(require, 'marks')
    if not ok then
      return
    end
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      vim.api.nvim_win_call(win, function()
        marks.refresh(true)
      end)
    end
  end

  FUNCTION.snapshot_marks = function()
    staged = collect_marks()
  end

  FUNCTION.restore_marks = function()
    local still = {}
    for _, mark in ipairs(staged) do
      local bufnr = vim.fn.bufnr(mark.file)
      if bufnr ~= -1 and vim.api.nvim_buf_is_loaded(bufnr) then
        place(mark, bufnr)
      else
        still[#still + 1] = mark
      end
    end
    staged = {}
    pending = still
    refresh_visible_marks()
  end

  local group = vim.api.nvim_create_augroup('auto_session_marks', { clear = true })

  vim.api.nvim_create_autocmd('BufRead', {
    group = group,
    callback = function(ev)
      if #pending == 0 then
        return
      end
      local file = vim.fn.fnamemodify(ev.file, ':p')
      local still = {}
      local applied = false
      for _, mark in ipairs(pending) do
        if mark.file == file then
          place(mark, ev.buf)
          applied = true
        else
          still[#still + 1] = mark
        end
      end
      pending = still
      if applied then
        refresh_visible_marks()
      end
    end,
  })

  vim.api.nvim_create_autocmd('VimLeavePre', {
    group = group,
    callback = function()
      if #pending == 0 then
        return
      end
      for _, mark in ipairs(pending) do
        local bufnr = vim.fn.bufadd(mark.file)
        vim.fn.bufload(bufnr)
        vim.bo[bufnr].buflisted = true
        place(mark, bufnr)
      end
      pending = {}
    end,
  })

  FUNCTION.add_session = function()
    Snacks.input({ prompt = 'Session name' },
      function(input)
        if input and input ~= '' then
          vim.cmd('AutoSession save ' .. input)
        end
      end
    )
  end

  return FUNCTION
end
