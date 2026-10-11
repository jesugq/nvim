do
  local FUNCTION = {}

  FUNCTION.highlights = function()
    vim.o.fillchars = [[eob: ,fold: ,foldopen:▼,foldclose:▶,foldsep: ,foldinner: ]]
  end

  return FUNCTION
end
