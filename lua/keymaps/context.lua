do
  local function copy_notify_path(message)
    vim.notify(message, vim.log.levels.INFO, { id = 'copy_path', title = 'copy Path', })
  end

  local function copy(info, description)
    vim.fn.setreg('+', info)
    vim.fn.setreg('"', info)

    if info ~= '' then
      copy_notify_path(string.format('Copied %s: %s', description, info))
    end
  end

  local path_contexts = {
    a = {
      description = 'absolute',
      path = function()
        return vim.fn.expand('%:p')
      end,
      directory = function()
        return vim.fn.expand('%:p:h')
      end,
    },
    r = {
      description = 'relative',
      path = function()
        return vim.fn.expand('%:.')
      end,
      directory = function()
        return vim.fn.fnamemodify(vim.fn.expand('%:.'), ':h')
      end,
    },
    f = {
      description = 'file',
      path = function()
        return vim.fn.expand('%:t')
      end,
      directory = function()
        return ''
      end,
    },
    w = {
      description = 'working directory',
      path = function()
        return vim.fn.expand('%:p:h')
      end,
      directory = function()
        return vim.fn.expand('%:p:h')
      end,
    },
  }

  local function context_path(context, transform)
    return transform(path_contexts[context].path())
  end

  local function copy_path(context)
    copy(context_path(context, function(path)
      return path
    end), path_contexts[context].description)
  end

  local function copy_directory(context)
    copy(path_contexts[context].directory(), path_contexts[context].description)
  end

  local function copy_url(context)
    copy(context_path(context, vim.uri_encode), path_contexts[context].description .. ' url')
  end

  local function copy_line(context)
    local path = path_contexts[context].path()
    local line = vim.api.nvim_win_get_cursor(0)[1]

    copy(string.format('%s:%d', path, line), path_contexts[context].description .. ' line')
  end

  local function copy_visual_line(context)
    local path = path_contexts[context].path()
    local start_line = vim.fn.line('v')
    local end_line = vim.fn.line('.')

    if start_line > end_line then
      start_line, end_line = end_line, start_line
    end

    local info = (start_line == end_line)
      and string.format('%s:%d', path, start_line)
      or string.format('%s:%d-%d', path, start_line, end_line)

    copy(info, path_contexts[context].description .. ' lines')

    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), 'n', true)
  end

  local function map_context(context)
    local description = path_contexts[context].description

    vim.keymap.set('n', '<leader>c' .. context .. 'w', function()
      copy_directory(context)
    end, { desc = 'Copy ' .. description .. ' directory' })
    if context ~= 'w' then
      vim.keymap.set('n', '<leader>c' .. context .. context, function()
        copy_path(context)
      end, { desc = 'Copy ' .. description })
    end
    vim.keymap.set('n', '<leader>c' .. context .. 'u', function()
      copy_url(context)
    end, { desc = 'Copy ' .. description .. ' url' })
    if context ~= 'w' then
      vim.keymap.set('n', '<leader>c' .. context .. 'l', function()
        copy_line(context)
      end, { desc = 'Copy ' .. description .. ' line' })
      vim.keymap.set('x', '<leader>c' .. context .. 'l', function()
        copy_visual_line(context)
      end, { desc = 'Copy ' .. description .. ' lines' })
    end
  end

  -- <leader>c
  vim.keymap.set('n', '<leader>cd', 'ggVGD', { desc = 'Copy dd' })
  vim.keymap.set('n', '<leader>cy', 'ggVGY', { desc = 'Copy yy' })

  for context in pairs(path_contexts) do
    map_context(context)
  end
end
