do
  local os_name = vim.uv.os_uname().sysname

  if os_name == 'Darwin' then
    return {
      og_dir = '~/Development/orgmode',
      md_dir = '~/Development/markdown',
      dy_dir = '~/.cursor/dynamic-mode',
    }
  else
    return {
      og_dir = '~/Sync/Apps/Orgmode',
      md_dir = '~/Sync/Apps/Markdown',
      dy_dir = '~/.cursor/dynamic-mode',
    }
  end
end
