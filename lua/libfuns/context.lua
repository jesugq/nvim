do
  local FUNCTION = {}

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

  FUNCTION.copy_notify_path = function(message)
    vim.notify(message, vim.log.levels.INFO, { id = 'copy_path', title = 'Copy Path', })
  end

  FUNCTION.copy = function(info, description)
    vim.fn.setreg('+', info)
    vim.fn.setreg('"', info)

    if info ~= '' then
      FUNCTION.copy_notify_path(string.format('Copied %s: %s', description, info))
    end
  end

  FUNCTION.context_path = function(context, transform)
    return transform(path_contexts[context].path())
  end

  FUNCTION.copy_path = function(context)
    FUNCTION.copy(FUNCTION.context_path(context, function(path)
      return path
    end), path_contexts[context].description)
  end

  FUNCTION.copy_directory = function(context)
    FUNCTION.copy(path_contexts[context].directory(), path_contexts[context].description)
  end

  FUNCTION.copy_url = function(context)
    FUNCTION.copy(FUNCTION.context_path(context, vim.uri_encode), path_contexts[context].description .. ' url')
  end

  FUNCTION.copy_line = function(context)
    local path = path_contexts[context].path()
    local line = vim.api.nvim_win_get_cursor(0)[1]

    FUNCTION.copy(string.format('%s:%d', path, line), path_contexts[context].description .. ' line')
  end

  FUNCTION.copy_visual_line = function(context)
    local path = path_contexts[context].path()
    local start_line = vim.fn.line('v')
    local end_line = vim.fn.line('.')

    if start_line > end_line then
      start_line, end_line = end_line, start_line
    end

    local info = (start_line == end_line)
      and string.format('%s:%d', path, start_line)
      or string.format('%s:%d-%d', path, start_line, end_line)

    FUNCTION.copy(info, path_contexts[context].description .. ' lines')

    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), 'n', true)
  end

  FUNCTION.map_context = function(context)
    local description = path_contexts[context].description

    vim.keymap.set('n', '<leader>c' .. context .. 'w', function()
      FUNCTION.copy_directory(context)
    end, { desc = 'Copy ' .. description .. ' directory' })
    if context ~= 'w' then
      vim.keymap.set('n', '<leader>c' .. context .. context, function()
        FUNCTION.copy_path(context)
      end, { desc = 'Copy ' .. description })
    end
    vim.keymap.set('n', '<leader>c' .. context .. 'u', function()
      FUNCTION.copy_url(context)
    end, { desc = 'Copy ' .. description .. ' url' })
    if context ~= 'w' then
      vim.keymap.set('n', '<leader>c' .. context .. 'l', function()
        FUNCTION.copy_line(context)
      end, { desc = 'Copy ' .. description .. ' line' })
      vim.keymap.set('x', '<leader>c' .. context .. 'l', function()
        FUNCTION.copy_visual_line(context)
      end, { desc = 'Copy ' .. description .. ' lines' })
    end
  end

  FUNCTION.map_contexts = function()
    for context in pairs(path_contexts) do
      FUNCTION.map_context(context)
    end
  end

  return FUNCTION
end
