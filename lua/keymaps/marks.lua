do
  local marks = require('marks')

  -- m OVERRIDE
  vim.keymap.set('n', 'm', function() marks.toggle() end, { desc = 'marks: toggle' })
end
