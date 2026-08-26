do
  local FUNCTION = {}

  FUNCTION.indents = function()
    vim.opt.conceallevel = 1
    vim.opt.expandtab = true
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2

    if vim.fn.expand('%:t') == 'prompt.md' then
      vim.wo.wrap = true
      vim.wo.linebreak = true
    end
  end

  return FUNCTION
end
