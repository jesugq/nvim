---@diagnostic disable: different-requires
do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'org',
    callback = function()
      local orgmode = require('orgmode')
      local insert = require('configs.insert')
      local tags = require('tags')
      local is_tagged = false
      local timer = nil

      vim.keymap.set('n', '<leader>bn', function() vim.cmd('e .org') end, {  desc = 'Orgmode new file' })

      vim.keymap.set('n', '<TAB>', function() orgmode.action('org_mappings.cycle') end, {
        buffer = true, desc = 'Org cycle'
      })
      vim.keymap.set('n', '<S-TAB>', function() orgmode.action('org_mappings.global_cycle') end, {
        buffer = true, desc = 'Org global cycle'
      })
      vim.keymap.set('n', '<CR>', function() orgmode.action('org_mappings.insert_heading_respect_content') end, {
        buffer = true, desc = 'Org insert parent respect content'
      })
      vim.keymap.set('n', '<C-CR>', function()
        orgmode.action('org_mappings.insert_heading_respect_content')
        orgmode.action('org_mappings.do_demote', true)
        -- vim.cmd('normal! zx')
        insert.new_space()
      end, { buffer = true, desc = 'Org insert child respect content' })

      vim.keymap.set('n', '<A-CR>', function() orgmode.action('org_mappings.open_at_point') end, {
        buffer = true, desc = 'Org open at point'
      })
      vim.keymap.set('n', '<A-k>', function()
        orgmode.action('org_mappings.move_subtree_up')
        -- vim.cmd('normal! zx')
      end, {
        buffer = true, desc = 'Org move subtree up'
      })
      vim.keymap.set('n', '<A-j>', function()
        orgmode.action('org_mappings.move_subtree_down')
        -- vim.cmd('normal! zx')
      end, {
        buffer = true, desc = 'Org move subtree down'
      })
      vim.keymap.set('n', '<A-h>', function()
        orgmode.action('org_mappings.do_promote', true)
        -- vim.cmd('normal! zx')
      end, {
        buffer = true, desc = 'Org move subtree left'
      })
      vim.keymap.set('n', '<A-l>', function()
        orgmode.action('org_mappings.do_demote', true)
        -- vim.cmd('normal! zx')
      end, {
        buffer = true, desc = 'Org move subtree right'
      })

      vim.keymap.set('n', '<C-c>e', function() orgmode.action('org_mappings.insert_link') end, {
        buffer = true, desc = 'Org insert external link'
      })
      vim.keymap.set('n', '<C-c>k', function() orgmode.action('org_mappings.priority_up') end, {
        buffer = true, desc = 'Org priority up'
      })
      vim.keymap.set('n', '<C-c>j', function() orgmode.action('org_mappings.priority_down') end, {
        buffer = true, desc = 'Org priority down'
      })
      vim.keymap.set('n', '<C-c>h', function() orgmode.action('org_mappings.todo_prev_state') end, {
        buffer = true, desc = 'Org todo prev state'
      })
      vim.keymap.set('n', '<C-c>l', function() orgmode.action('org_mappings.todo_next_state') end, {
        buffer = true, desc = 'Org todo next state'
      })
      vim.keymap.set('n', '<C-c>a', function()
        insert.new_space()
        vim.cmd('stopinsert')
        orgmode.action('org_mappings.org_time_stamp')
      end, {
        buffer = true, desc = 'Org time stamp'
      })
      vim.keymap.set('n', '<C-c>s', function() orgmode.action('org_mappings.org_schedule') end, {
        buffer = true, desc = 'Org schedule'
      })
      vim.keymap.set('n', '<C-c>d', function() orgmode.action('org_mappings.org_deadline') end, {
        buffer = true, desc = 'Org deadline'
      })
      vim.keymap.set('n', '<C-c>P', function()
        local tag = vim.fn.input('New tag: ')
        if tag ~= '' then
          tags.new_tag(tag)
        end
      end, { buffer = true, desc = 'New tag' })
      vim.keymap.set('n', '<C-c>p', function()
        if not is_tagged then
          is_tagged = true
          orgmode.action('org_mappings.set_tags', tags.tag)
        else
          is_tagged = false
          orgmode.action('org_mappings.set_tags', '')
          return
        end

        if timer then
          timer:stop()
        else
          timer = vim.uv.new_timer()
        end

        timer:start(1000, 0,
          vim.schedule_wrap(function()
            is_tagged = false
            if timer and not timer:is_closing() then
              timer:close()
              timer = nil
            end
          end)
        )
      end, { buffer = true, desc = 'Org set tag' })
    end,
  })

  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'orgagenda',
    callback = function()
      local orgmode = require('orgmode')

      vim.keymap.set('n', 'q', ':bnext<CR>', {
        buffer = true, desc = 'Orgagenda exit', remap = false
      })
      vim.keymap.set('n', '<CR>', function() orgmode.action('agenda.switch_to_item') end, {
        buffer = true, desc = 'Orgagenda switch to item'
      })

      vim.keymap.set('n', '<', function() orgmode.action('agenda.advance_span', -1) end, {
        buffer = true, desc = 'Orgagenda rewind span'
      })
      vim.keymap.set('n', '>', function() orgmode.action('agenda.advance_span', 1) end, {
        buffer = true, desc = 'Orgagenda advance span'
      })
    end,
  })

  vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'org', 'orgagenda' },
    callback = function()
      local orgmode = require('orgmode')
      local folders = require('configs.folders')
      local tags = require('tags')

      vim.keymap.set('n', '<leader>aa', function() orgmode.action('agenda.open_by_key', 'a') end, {
        buffer = true, desc = 'Org Live'
      })
      vim.keymap.set('n', '<leader>aP', function()
        local tag = vim.fn.input('New tag: ')
        if tag ~= '' then
          tags.new_tag(tag)
        end
      end, { buffer = true, desc = 'New tag' })
      vim.keymap.set('n', '<leader>ap', function() orgmode.action('agenda.open_by_key', 'p') end, {
        buffer = true, desc = 'Org Tag'
      })

      vim.keymap.set('n', '<leader>a1', function()
        folders.random_file('1-projects')
      end, { buffer = true, desc = 'Markdown project' })
      vim.keymap.set('n', '<leader>a2', function()
        folders.random_file('2-notepads')
      end, { buffer = true, desc = 'Markdown notepad' })
      vim.keymap.set('n', '<leader>a3', function()
        folders.random_file('3-features')
      end, { buffer = true, desc = 'Markdown feature' })
      vim.keymap.set('n', '<leader>a4', function()
        folders.random_file('4-insights')
      end, { buffer = true, desc = 'Markdown insight' })
    end,
  })
end
