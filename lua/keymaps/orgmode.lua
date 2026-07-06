do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'org',
    callback = function()
      local orgmode = require('orgmode')

      vim.keymap.set({'n', 'i'}, '<TAB>', function() orgmode.action('org_mappings.cycle') end, {
        buffer = true, desc = 'Org cycle'
      })

      vim.keymap.set({'n', 'i'}, '<S-TAB>', function() orgmode.action('org_mappings.global_cycle') end, {
        buffer = true, desc = 'Org global cycle'
      })

      vim.keymap.set({'n', 'i'}, '<A-CR>', function() orgmode.action('org_mappings.open_at_point') end, {
        buffer = true, desc = 'Org open at point'
      })
      vim.keymap.set({'n', 'i'}, '<A-h>', function() orgmode.action('org_mappings.do_promote') end, {
        buffer = true, desc = 'Org do promote'
      })
      vim.keymap.set({'n', 'i'}, '<A-l>', function() orgmode.action('org_mappings.do_demote') end, {
        buffer = true, desc = 'Org do demote'
      })
      vim.keymap.set({'n', 'i'}, '<A-K>', function() orgmode.action('org_mappings.move_subtree_up') end, {
        buffer = true, desc = 'Org move subtree up'
      })
      vim.keymap.set({'n', 'i'}, '<A-J>', function() orgmode.action('org_mappings.move_subtree_down') end, {
        buffer = true, desc = 'Org move subtree down'
      })
      vim.keymap.set({'n', 'i'}, '<A-H>', function() orgmode.action('org_mappings.do_promote', true) end, {
        buffer = true, desc = 'Org move subtree left'
      })
      vim.keymap.set({'n', 'i'}, '<A-L>', function() orgmode.action('org_mappings.do_demote', true) end, {
        buffer = true, desc = 'Org move subtree right'
      })

      vim.keymap.set({'n', 'i'}, '<C-CR>', function() orgmode.action('org_mappings.insert_heading_respect_content') end, {
        buffer = true, desc = 'Org insert heading respect content'
      })
      vim.keymap.set({'n', 'i'}, '<C-k>', function() orgmode.action('org_mappings.priority_up') end, {
        buffer = true, desc = 'Org priority up'
      })
      vim.keymap.set({'n', 'i'}, '<C-j>', function() orgmode.action('org_mappings.priority_down') end, {
        buffer = true, desc = 'Org priority down'
      })
      vim.keymap.set({'n', 'i'}, '<C-h>', function() orgmode.action('org_mappings.todo_prev_state') end, {
        buffer = true, desc = 'Org todo prev state'
      })
      vim.keymap.set({'n', 'i'}, '<C-l>', function() orgmode.action('org_mappings.todo_next_state') end, {
        buffer = true, desc = 'Org todo next state'
      })
      vim.keymap.set({'n', 'i'}, '<C-g>', ':e @inbox.org<CR>', {
        buffer = true, desc = 'Org open inbox'
      })

      vim.keymap.set({'n', 'i'}, '<C-c>h', function() orgmode.action('org_mappings.store_link') end, {
        buffer = true, desc = 'Org store link'
      })
      vim.keymap.set({'n', 'i'}, '<C-c>l', function() orgmode.action('org_mappings.insert_link') end, {
        buffer = true, desc = 'Org insert link'
      })
      vim.keymap.set({'n', 'i'}, '<C-c>c', function() orgmode.action('org_mappings.set_tags') end, {
        buffer = true, desc = 'Org set tags'
      })
      vim.keymap.set({'n', 'i'}, '<C-c>d', function() orgmode.action('org_mappings.org_deadline') end, {
        buffer = true, desc = 'Org deadline'
      })
      vim.keymap.set({'n', 'i'}, '<C-c>s', function() orgmode.action('org_mappings.org_schedule') end, {
        buffer = true, desc = 'Org schedule'
      })
      vim.keymap.set({'n', 'i'}, '<C-c>k', function() orgmode.action('org_mappings.timestamp_up') end, {
        buffer = true, desc = 'Org timestamp up'
      })
      vim.keymap.set({'n', 'i'}, '<C-c>j', function() orgmode.action('org_mappings.timestamp_down') end, {
        buffer = true, desc = 'Org timestamp down'
      })
    end,
  })

  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'orgagenda',
    callback = function()
      local orgmode = require('orgmode')


      vim.keymap.set('n', '<CR>', function() orgmode.action('agenda.preview_item') end, {
        buffer = true, desc = 'Orgagenda preview item'
      })

      vim.keymap.set('n', '<C-CR>', function() orgmode.action('agenda.switch_to_item') end, {
        buffer = true, desc = 'Orgagenda switch to item'
      })
      vim.keymap.set('n', '<C-h>', function() orgmode.action('agenda.advance_span', -1) end, {
        buffer = true, desc = 'Orgagenda rewind span'
      })
      vim.keymap.set('n', '<C-j>', function() orgmode.action('agenda.reset') end, {
        buffer = true, desc = 'Orgagenda reset'
      })
      vim.keymap.set('n', '<C-k>', function() orgmode.action('agenda.goto_date') end, {
        buffer = true, desc = 'Orgagenda go to date'
      })
      vim.keymap.set('n', '<C-l>', function() orgmode.action('agenda.advance_span', 1) end, {
        buffer = true, desc = 'Orgagenda advance span'
      })

      vim.keymap.set('n', '<C-c>c', function() orgmode.action('agenda.set_tags') end, {
        buffer = true, desc = 'Orgagenda set tags'
      })
      vim.keymap.set('n', '<C-c>d', function() orgmode.action('agenda.set_deadline') end, {
        buffer = true, desc = 'Orgagenda set deadline'
      })
      vim.keymap.set('n', '<C-c>s', function() orgmode.action('agenda.set_schedule') end, {
        buffer = true, desc = 'Orgagenda set schedule'
      })
    end,
  })

  vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'org', 'orgagenda' },
    callback = function()
      local orgmode = require('orgmode')

      vim.keymap.set('n', '<leader>ah', function() orgmode.action('agenda.open_by_key', 'h') end, {
        buffer = true, desc = 'Org higher'
      })
        vim.keymap.set('n', '<leader>aa', function() orgmode.action('agenda.open_by_key', 'a') end, {
        buffer = true, desc = 'Org agenda'
      })
      vim.keymap.set('n', '<leader>aq', function() orgmode.action('agenda.open_by_key', 'w') end, {
        buffer = true, desc = 'Org query'
      })
      vim.keymap.set('n', '<leader>af', function() orgmode.action('agenda.open_by_key', 'f') end, {
        buffer = true, desc = 'Org fuzzy'
      })
      vim.keymap.set('n', '<leader>ar', function() orgmode.action('agenda.open_by_key', 'r') end, {
        buffer = true, desc = 'Org ready'
      })
      vim.keymap.set('n', '<leader>ao', function() orgmode.action('agenda.open_by_key', 'o') end, {
        buffer = true, desc = 'Org oled'
      })
      vim.keymap.set('n', '<leader>ai', function() orgmode.action('agenda.open_by_key', 'i') end, {
        buffer = true, desc = 'Org inkd'
      })
    end,
  })
end
