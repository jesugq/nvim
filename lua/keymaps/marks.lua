do
  local marks = require('libfuns.marks')

  vim.keymap.set('n', 'm', function() marks.toggle_mark() end, { desc = 'marks: toggle' })
  vim.keymap.set('n', 'M', function() marks.toggle_mark_up() end, { desc = 'marks: toggle up' })
end
