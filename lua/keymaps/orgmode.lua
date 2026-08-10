---@diagnostic disable: different-requires
do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'org',
    callback = function()
      local orgmode = require('orgmode')
      local insert = require('configs.insert')

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
        vim.cmd('normal! zx')
        insert.new_space()
      end, { buffer = true, desc = 'Org insert child respect content' })

      vim.keymap.set('n', '<A-CR>', function() orgmode.action('org_mappings.open_at_point') end, {
        buffer = true, desc = 'Org open at point'
      })
      vim.keymap.set('n', '<A-k>', function()
        orgmode.action('org_mappings.move_subtree_up')
        vim.cmd('normal! zx')
      end, {
        buffer = true, desc = 'Org move subtree up'
      })
      vim.keymap.set('n', '<A-j>', function()
        orgmode.action('org_mappings.move_subtree_down')
        vim.cmd('normal! zx')
      end, {
        buffer = true, desc = 'Org move subtree down'
      })
      vim.keymap.set('n', '<A-h>', function()
        orgmode.action('org_mappings.do_promote', true)
        vim.cmd('normal! zx')
      end, {
        buffer = true, desc = 'Org move subtree left'
      })
      vim.keymap.set('n', '<A-l>', function()
        orgmode.action('org_mappings.do_demote', true)
        vim.cmd('normal! zx')
      end, {
        buffer = true, desc = 'Org move subtree right'
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
      vim.keymap.set('n', '<C-c>p', function() orgmode.action('org_mappings.insert_link') end, {
        buffer = true, desc = 'Org insert link to hyperlink'
      })
      vim.keymap.set('n', '<C-c>c', function() orgmode.action('org_mappings.set_tags') end, {
        buffer = true, desc = 'Org set tags'
      })
      vim.keymap.set('n', '<C-c>a', function() orgmode.action('org_mappings.org_time_stamp') end, {
        buffer = true, desc = 'Org time stamp'
      })
      vim.keymap.set('n', '<C-c>s', function() orgmode.action('org_mappings.org_schedule') end, {
        buffer = true, desc = 'Org schedule'
      })
      vim.keymap.set('n', '<C-c>d', function() orgmode.action('org_mappings.org_deadline') end, {
        buffer = true, desc = 'Org deadline'
      })
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

      vim.keymap.set('n', '<C-c>c', function() orgmode.action('agenda.set_tags') end, {
        buffer = true, desc = 'Orgagenda set tags'
      })
      vim.keymap.set('n', '<C-c>d', function() orgmode.action('agenda.set_deadline') end, {
        buffer = true, desc = 'Orgagenda set deadline'
      })
      vim.keymap.set('n', '<C-c>s', function() orgmode.action('agenda.set_schedule') end, {
        buffer = true, desc = 'Orgagenda set schedule'
      })
      vim.keymap.set('n', '<C-c>r', function() orgmode.action('agenda.reset') end, {
        buffer = true, desc = 'Orgagenda reset'
      })
      vim.keymap.set('n', '<C-c>t', function() orgmode.action('agenda.goto_date') end, {
        buffer = true, desc = 'Orgagenda go to date'
      })
    end,
  })

  vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'org', 'orgagenda' },
    callback = function()
      local orgmode = require('orgmode')
      local folders = require('configs.folders')

      vim.keymap.set('n', '<leader>an', function() orgmode.action('agenda.open_by_key', 'n') end, {
        buffer = true, desc = 'Org Nuke'
      })
      vim.keymap.set('n', '<leader>am', function() orgmode.action('agenda.open_by_key', 'm') end, {
        buffer = true, desc = 'Org Make'
      })
      vim.keymap.set('n', '<leader>ai', function() orgmode.action('agenda.open_by_key', 'i') end, {
        buffer = true, desc = 'Org Inner'
      })
      vim.keymap.set('n', '<leader>ao', function() orgmode.action('agenda.open_by_key', 'o') end, {
        buffer = true, desc = 'Org Outer'
      })

      vim.keymap.set('n', '<leader>a1', function()
        folders.random_file('1-projects', { replace = true })
      end, { buffer = true, desc = 'Markdown project' })
      vim.keymap.set('n', '<leader>a2', function()
        folders.random_file('2-notepads', { replace = true })
      end, { buffer = true, desc = 'Markdown notepad' })
      vim.keymap.set('n', '<leader>a3', function()
        folders.random_file('3-features', { replace = true })
      end, { buffer = true, desc = 'Markdown feature' })
      vim.keymap.set('n', '<leader>a4', function()
        folders.random_file('4-insights', { replace = true, wrap = true })
      end, { buffer = true, desc = 'Markdown insight' })
    end,
  })
end
