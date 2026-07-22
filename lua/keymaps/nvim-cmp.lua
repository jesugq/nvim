do
  local FUNCTION = {}

  FUNCTION.mappings = function(cmp)
    return {
      ['<Esc>'] = cmp.mapping.abort(),
      ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    }
  end

  return FUNCTION
end
