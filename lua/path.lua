do
  local os_name = vim.uv.os_uname().sysname

  if os_name == 'Darwin' then
    return {
      og_dir = '~/Development/orgmode',
      md_dir = '~/Development/markdown',
    }
  else
    return {
      og_dir = '~/Sync/Apps/Orgmode',
      md_dir = '~/Sync/Apps/Markdown',
    }
  end
end
