do
  local FUNCTION = {}

  FUNCTION.highlights = function()
    vim.o.fillchars = [[eob: ,fold: ,foldopen:▼,foldclose:▶,foldsep: ,foldinner: ]]
    vim.wo.fillchars = vim.o.fillchars
  end

  return FUNCTION
end
