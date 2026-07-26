do
  vim.keymap.set('n', '[m', '<Nop>', { desc = 'Previous method start' })
  vim.keymap.set('n', ']m', '<Nop>', { desc = 'Next method start' })

  local OBJECT = {}

  OBJECT = {
    set = 'm',
    delete = 'dm',
    prev = '[m',
    next = ']m',
  }

  return OBJECT
end

