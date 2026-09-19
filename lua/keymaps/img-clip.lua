do
  -- <C-c>p
  vim.keymap.set('n', '<C-c>p', function()
    local date_prefix = os.date("%Y-%m-%d ")

    Snacks.input({ prompt = 'New image', },
      function(input)
        if input and input ~= "" then
          local img_clip = require('img-clip')
          img_clip.paste_image({ file_name = date_prefix .. input, })
        end
      end
    )
  end, { desc = 'Img Clip Paste Image' })
end
