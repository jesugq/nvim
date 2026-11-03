do
  local FUNCTION = {}

  local path_contexts = {
    a = {
      description = 'absolute',
      directory = function()
        return vim.fn.expand('%:p:h')
      end,
      filename = function()
        return vim.fn.expand('%:p')
      end,
    },
    r = {
      description = 'relative',
      directory = function()
        return vim.fn.fnamemodify(vim.fn.expand('%:.'), ':h')
      end,
      filename = function()
        return vim.fn.expand('%:.')
      end,
    },
    p = {
      description = 'present',
      directory = function()
        return ''
      end,
      filename = function()
        return vim.fn.expand('%:t')
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

  local function copy_field(context, field, label)
    local info = path_contexts[context][field]()
    local description = path_contexts[context].description .. ' ' .. label

    FUNCTION.copy(info, description)
  end

  FUNCTION.copy_directory = function(context)
    copy_field(context, 'directory', 'directory')
  end

  FUNCTION.copy_filename = function(context)
    copy_field(context, 'filename', 'filename')
  end

  FUNCTION.copy_line = function(context)
    local path = path_contexts[context].filename()
    local line = vim.api.nvim_win_get_cursor(0)[1]

    FUNCTION.copy(string.format('%s:%d', path, line), path_contexts[context].description .. ' line')
  end

  FUNCTION.copy_visual_line = function(context)
    local path = path_contexts[context].filename()
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

  return FUNCTION
end
