do
  local recording_register

  local function recording_notify(message, options)
    vim.notify(message, vim.log.levels.INFO, vim.tbl_extend('force', {
      id = 'macro-recording',
      title = 'Macro Recording',
    }, options))
  end

  vim.api.nvim_create_autocmd('RecordingEnter', {
    callback = function()
      recording_register = vim.fn.reg_recording()
      recording_notify('Start macro @' .. recording_register, { timeout = false, })
    end,
  })

  vim.api.nvim_create_autocmd('RecordingLeave', {
    callback = function()
      recording_notify('Write macro @' .. recording_register, { timeout = true, })
      recording_register = nil
    end,
  })
end
