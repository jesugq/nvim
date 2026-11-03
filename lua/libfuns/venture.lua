do
  local FUNCTION = {}

  FUNCTION.view_notify = function(message, level)
    vim.notify(message, level or vim.log.levels.INFO, { id = 'view_path', title = 'View Path', })
  end

  local function clipboard_path()
    local info = vim.fn.getreg('+')
    if info == '' then
      info = vim.fn.getreg('"')
    end
    return vim.trim(info)
  end

  local function parse_path(info)
    local path, start_line, end_line = info:match('^(.*):(%d+)%-(%d+)$')
    if path then
      return path, tonumber(start_line), tonumber(end_line)
    end

    path, start_line = info:match('^(.*):(%d+)$')
    if path then
      local line = tonumber(start_line)
      return path, line, line
    end

    return info, nil, nil
  end

  local function resolve_path(path)
    return vim.fs.normalize(vim.fn.fnamemodify(path, ':p'))
  end

  local function select_lines(start_line, end_line)
    local last = vim.api.nvim_buf_line_count(0)
    start_line = math.max(1, math.min(start_line, last))
    end_line = math.max(1, math.min(end_line, last))

    if start_line > end_line then
      start_line, end_line = end_line, start_line
    end

    vim.api.nvim_win_set_cursor(0, { start_line, 0 })
    vim.cmd('normal! V')
    if end_line ~= start_line then
      vim.api.nvim_win_set_cursor(0, { end_line, 0 })
    end
  end

  local function read_clipboard()
    local info = clipboard_path()
    if info == '' then
      FUNCTION.view_notify('Clipboard is empty', vim.log.levels.WARN)
      return nil
    end

    return info
  end

  local function open_path(path, start_line, end_line)
    local resolved = resolve_path(path)
    local stat = vim.uv.fs_stat(resolved)

    if not stat then
      FUNCTION.view_notify('Not found: ' .. resolved, vim.log.levels.WARN)
      return
    end

    if stat.type == 'directory' then
      Snacks.explorer.reveal({ file = resolved })
      return
    end

    vim.cmd.edit(vim.fn.fnameescape(resolved))

    if start_line then
      vim.schedule(function()
        select_lines(start_line, end_line)
      end)
    end
  end

  FUNCTION.view_directory = function()
    local info = read_clipboard()
    if not info then
      return
    end

    local resolved = resolve_path(info)
    if not vim.uv.fs_stat(resolved) then
      FUNCTION.view_notify('Not found: ' .. resolved, vim.log.levels.WARN)
      return
    end

    Snacks.explorer.reveal({ file = resolved })
  end

  FUNCTION.view_filename = function()
    local info = read_clipboard()
    if not info then
      return
    end

    open_path(info)
  end

  FUNCTION.view_line = function()
    local info = read_clipboard()
    if not info then
      return
    end

    local path, start_line, end_line = parse_path(info)
    open_path(path, start_line, end_line)
  end

  FUNCTION.view_visual_line = FUNCTION.view_line

  local function clipboard_lines()
    local lines = vim.fn.getreg('+', 1, true)
    if type(lines) ~= 'table' or #lines == 0 then
      lines = vim.fn.getreg('"', 1, true)
    end

    if type(lines) ~= 'table' or #lines == 0 then
      return { '' }
    end

    return lines
  end

  FUNCTION.view_dd = function()
    vim.api.nvim_buf_set_lines(0, 0, -1, false, clipboard_lines())
  end

  FUNCTION.view_yy = function()
    vim.cmd('enew')
    vim.api.nvim_buf_set_lines(0, 0, -1, false, clipboard_lines())
  end

  return FUNCTION
end
