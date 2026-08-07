do
  vim.keymap.set("n", "<leader>ch", "<cmd>CellularAutomaton left<CR>", { desc = 'Cellular Automaton left' })
  vim.keymap.set("n", "<leader>cj", "<cmd>CellularAutomaton down<CR>", { desc = 'Cellular Automaton down' })
  vim.keymap.set("n", "<leader>ck", "<cmd>CellularAutomaton up<CR>", { desc = 'Cellular Automaton up' })
  vim.keymap.set("n", "<leader>cl", "<cmd>CellularAutomaton right<CR>", { desc = 'Cellular Automaton right' })
  vim.keymap.set("n", "<leader>cs", "<cmd>CellularAutomaton scram<CR>", { desc = 'Cellular Automaton scram' })
  vim.keymap.set("n", "<leader>cf", "<cmd>CellularAutomaton fall<CR>", { desc = 'Cellular Automaton fall' })
  vim.keymap.set("n", "<leader>cg", "<cmd>CellularAutomaton game<CR>", { desc = 'Cellular Automaton scram' })
end
