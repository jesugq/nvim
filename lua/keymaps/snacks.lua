do
  local person_marks = function(item)
    if item.label and item.label:match("^[a-zA-Z]$") then
      return item
    end
    return false
  end

  local neovim_marks = function(item)
    if item.label and item.label:match("^[a-zA-Z]$") then
      return false
    end
    return item
  end

  local buffer_marks = function(opts)
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

  -- <C-b>
  vim.keymap.set('n', '<C-b>e', function() Snacks.explorer() end, { desc = 'Snacks explorer' })
  vim.keymap.set('n', '<C-b>w', function() Snacks.picker.buffers() end, { desc = 'Snacks window' })
  vim.keymap.set('n', '<C-b>r', function() Snacks.picker.recent() end, { desc = 'Snacks recent' })
  vim.keymap.set('n', '<C-b>f', function() Snacks.picker.files({ regex = false, }) end, { desc = 'Snacks picker files' })
  vim.keymap.set('n', '<C-b>F', function() Snacks.picker.files({ regex = true, }) end, { desc = 'Snacks picker files' })
  vim.keymap.set('n', '<C-b>x', function() Snacks.bufdelete() end, { desc = 'Snacks bufdelete' })
  vim.keymap.set('n', '<C-b>X', function() Snacks.bufdelete.all() end, { desc = 'Snacks bufdelete all' })
  vim.keymap.set('n', '<C-b>g', function() Snacks.picker.grep({ regex = false, }) end, { desc = 'Snacks picker grep' })
  vim.keymap.set('n', '<C-b>G', function() Snacks.picker.grep({ regex = true, }) end, { desc = 'Snacks picker grep regex' })
  vim.keymap.set('n', '<C-b>b', function() Snacks.picker.grep_buffers({ regex = false, }) end, { desc = 'Snacks picker grep buffers' })
  vim.keymap.set('n', '<C-b>B', function() Snacks.picker.grep_buffers({ regex = true, }) end, { desc = 'Snacks picker grep buffers regex' })
  vim.keymap.set('n', '<C-b>m', function() Snacks.picker.marks({ finder = buffer_marks, transform = function(item) return person_marks(item) end }) end, { desc = 'Snacks picker marks in open buffers' })

  -- <leader>s
  vim.keymap.set('n', '<leader>ss', function() Snacks.picker.resume() end, { desc = 'Snacks picker resume' })
  vim.keymap.set('n', '<leader>s:', function() Snacks.picker.command_history() end, { desc = 'Snacks picker command history' })
  vim.keymap.set('n', '<leader>s/', function() Snacks.picker.search_history() end, { desc = 'Snacks picker search history' })
  vim.keymap.set('n', '<leader>s"', function() Snacks.picker.registers({ transform = function(item) return neovim_marks(item) end }) end, { desc = 'Snacks picker numbered/default registers' })
  vim.keymap.set('n', '<leader>sq', function() Snacks.picker.registers({ transform = function(item) return person_marks(item) end }) end, { desc = 'Snacks picker macro registers' })
  vim.keymap.set('n', '<leader>sm', function() Snacks.picker.marks({ transform = function(item) return person_marks(item) end }) end, { desc = 'Snacks picker marks local' })
  vim.keymap.set('n', '<leader>sM', function() Snacks.picker.marks({ transform = function(item) return neovim_marks(item) end }) end, { desc = 'Snacks picker marks global' })
  vim.keymap.set('n', '<leader>sh', function() Snacks.picker.help({ focus = 'input' }) end, { desc = 'Snacks picker help' })
  vim.keymap.set('n', '<leader>sk', function() Snacks.picker.keymaps({ focus = 'input' }) end, { desc = 'Snacks picker keymaps' })

  -- gs
  vim.keymap.set('n', 'gsi', function() Snacks.picker.lsp_implementations() end, { desc = 'Snacks picker LSP implementations' })
  vim.keymap.set('n', 'gsr', function() Snacks.picker.lsp_references() end, { desc = 'Snacks picker LSP references' })
  vim.keymap.set('n', 'gst', function() Snacks.picker.lsp_type_definitions() end, { desc = 'Snacks picker LSP type definitions' })
  vim.keymap.set('n', 'gss', function() Snacks.picker.lsp_symbols() end, { desc = 'Snacks picker LSP document symbols' })
  vim.keymap.set('n', 'gsd', function() Snacks.picker.lsp_definitions() end, { desc = 'Snacks picker LSP definitions' })
  vim.keymap.set('n', 'gsD', function() Snacks.picker.lsp_declarations() end, { desc = 'Snacks picker LSP declarations' })
  vim.keymap.set('n', 'gs,', function() Snacks.picker.lsp_incoming_calls() end, { desc = 'Snacks picker LSP incoming calls' })
  vim.keymap.set('n', 'gs.', function() Snacks.picker.lsp_outgoing_calls() end, { desc = 'Snacks picker LSP outgoing calls' })
  vim.keymap.set('n', 'gsw', function() Snacks.picker.lsp_workspace_symbols() end, { desc = 'Snacks picker LSP workspace symbols' })
end
