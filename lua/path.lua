do
  local os_name = vim.uv.os_uname().sysname

  if os_name == "Darwin" then
    return {
      org_dir = '~/Development/orgmode',
      mark_dir = '~/Development/markdown',
    }
  else
    return {
      org_dir = '~/Sync/Apps/Orgmode',
      mark_dir = '~/Sync/Apps/Markdown',
    }
  end
end
