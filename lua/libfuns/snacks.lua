do
  local FUNCTION = {}

  FUNCTION.incoming_links = function()
    Snacks.picker.grep({
      search = vim.uri_encode(vim.fn.expand('%:.')),
      regex = false,
    })
  end

  FUNCTION.outgoing_links = function()
    Snacks.picker.lines({
      pattern = '](',
      layout = { preset = 'default', preview = true },
    })
  end

  FUNCTION.person_marks = function(item)
    if item.label and item.label:match("^[a-zA-Z]$") then
      return item
    end
    return false
  end

  FUNCTION.neovim_marks = function(item)
    if item.label and item.label:match("^[a-zA-Z]$") then
      return false
    end
    return item
  end

  FUNCTION.buffer_marks = function(opts)
    local marks = {}
    if opts.global ~= false then
      vim.list_extend(marks, vim.fn.getmarklist())
    end
    if opts['local'] ~= false then
      local seen = {}
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        local open = vim.api.nvim_buf_is_valid(buf) and (vim.bo[buf].buflisted or vim.api.nvim_buf_is_loaded(buf))
        if open and not seen[buf] then
          seen[buf] = true
          local bufname = vim.api.nvim_buf_get_name(buf)
          for _, mark in ipairs(vim.fn.getmarklist(buf)) do
            if not mark.file or mark.file == '' then
              mark.file = bufname
            end
            if not mark.pos[1] or mark.pos[1] == 0 then
              mark.pos[1] = buf
            end
            marks[#marks + 1] = mark
          end
        end
      end
    end

    local items = {}
    local lastused = {}
    local file_lines = {}
    local function mark_line(buf, file, lnum)
      if not lnum or lnum <= 0 then
        return nil
      end
      if buf and vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_is_loaded(buf) then
        return vim.api.nvim_buf_get_lines(buf, lnum - 1, lnum, false)[1]
      end
      if type(file) ~= 'string' or file == '' then
        return nil
      end
      local cached = file_lines[file]
      if cached == false then
        return nil
      end
      if not cached or #cached < lnum then
        local ok, lines = pcall(vim.fn.readfile, file, '', lnum)
        if not ok then
          file_lines[file] = false
          return nil
        end
        file_lines[file] = lines
        cached = lines
      end
      return cached[lnum]
    end
    local function buf_lastused(buf)
      if not buf or not vim.api.nvim_buf_is_valid(buf) then
        return 0
      end
      if lastused[buf] == nil then
        local info = vim.fn.getbufinfo(buf)[1]
        lastused[buf] = info and info.lastused or 0
      end
      return lastused[buf]
    end
    for _, mark in ipairs(marks) do
      local buf = mark.pos[1] and mark.pos[1] > 0 and mark.pos[1] or nil
      local line = mark_line(buf, mark.file, mark.pos[2])
      local label = mark.mark:sub(2, 2)
      items[#items + 1] = {
        text = table.concat({ label, mark.file, line }, ' '),
        label = label,
        line = line,
        buf = buf,
        file = mark.file,
        pos = mark.pos[2] > 0 and { mark.pos[2], mark.pos[3] },
        lastused = buf_lastused(buf),
      }
    end

    table.sort(items, function(a, b)
      if a.lastused ~= b.lastused then
        return a.lastused > b.lastused
      end
      local a_group = a.buf or a.file or ''
      local b_group = b.buf or b.file or ''
      if a_group ~= b_group then
        return tostring(a_group) < tostring(b_group)
      end
      return a.label < b.label
    end)
    return items
  end

  return FUNCTION
end
