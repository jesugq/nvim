do
  -- <leader><leader>
  vim.keymap.set('n', '<leader><leader>', function()
    local atsign_file = vim.fs.normalize(vim.fs.joinpath(vim.uv.cwd(), '@jesus'))
    local current = vim.api.nvim_get_current_buf()
    local current_file = vim.fs.normalize(vim.api.nvim_buf_get_name(current))

    if current_file == atsign_file then
      vim.cmd('buffer #')
    else
      vim.cmd.edit(vim.fn.fnameescape(atsign_file))
    end
  end, { desc = 'Toggle atsign' })
end
