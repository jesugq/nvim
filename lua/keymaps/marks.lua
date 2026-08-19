do
  vim.keymap.set('n', '[m', '<Nop>', { desc = 'Prev method' })
  vim.keymap.set('n', ']m', '<Nop>', { desc = 'Next method' })
  vim.keymap.set('n', ']M', ']m', { remap = true, desc = 'Next method' })
  vim.keymap.set('n', '[M', '[m', { remap = true, desc = 'Prev method' })
  vim.keymap.set('n', '[m', '<Plug>(Marks-prev)', { remap = true, desc = 'Prev mark' })
  vim.keymap.set('n', ']m', '<Plug>(Marks-next)', { remap = true, desc = 'Next mark' })

  local OBJECT = {}

  OBJECT = {
    set = 'm',
    delete = 'dm',
  }

  return OBJECT
end

