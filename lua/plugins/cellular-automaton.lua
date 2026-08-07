---@diagnostic disable: different-requires
do
  vim.pack.add { 'https://github.com/Eandrju/cellular-automaton.nvim' }
  local cellular_automaton = require('cellular-automaton')
end
