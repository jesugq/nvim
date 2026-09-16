---@diagnostic disable: different-requires
do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'org',
    callback = function()
      local orgmode = require('orgmode')
      local insert = require('configs.insert')
      local linksert = require('configs.linksert')

      -- <???>
      vim.keymap.set('n', '<CR>', function() orgmode.action('org_mappings.insert_heading_respect_content') end, {
        buffer = true, desc = 'Org insert parent respect content',
      })
      vim.keymap.set('n', '<C-CR>', function()
        orgmode.action('org_mappings.insert_heading_respect_content')
        orgmode.action('org_mappings.do_demote', true)
        insert.new_space()
      end, { buffer = true, desc = 'Org insert child respect content' })
      vim.keymap.set('n', '<A-CR>', function() orgmode.action('org_mappings.open_at_point') end, {
        buffer = true, desc = 'Org open at point',
      })

      -- <C-?>
      vim.keymap.set({'n', 'i'}, '<C-k>', function() orgmode.action('org_mappings.priority_up') end, {
        buffer = true, desc = 'Org priority up',
      })
      vim.keymap.set({'n', 'i'}, '<C-j>', function() orgmode.action('org_mappings.priority_down') end, {
        buffer = true, desc = 'Org priority down',
      })
      vim.keymap.set({'n', 'i'}, '<C-h>', function() orgmode.action('org_mappings.todo_prev_state') end, {
        buffer = true, desc = 'Org todo prev state',
      })
      vim.keymap.set({'n', 'i'}, '<C-l>', function() orgmode.action('org_mappings.todo_next_state') end, {
        buffer = true, desc = 'Org todo next state',
      })

      -- <A-?>
      vim.keymap.set('n', '<A-k>', function()
        orgmode.action('org_mappings.move_subtree_up')
      end, {
        buffer = true, desc = 'Org move subtree up',
      })
      vim.keymap.set('n', '<A-j>', function()
        orgmode.action('org_mappings.move_subtree_down')
      end, {
        buffer = true, desc = 'Org move subtree down',
      })
      vim.keymap.set('n', '<A-h>', function()
        orgmode.action('org_mappings.do_promote', true)
      end, {
        buffer = true, desc = 'Org move subtree left',
      })
      vim.keymap.set('n', '<A-l>', function()
        orgmode.action('org_mappings.do_demote', true)
      end, {
        buffer = true, desc = 'Org move subtree right',
      })

    end,
  })

  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'orgagenda',
    callback = function()
      local orgmode = require('orgmode')

      -- <???>
      vim.keymap.set('n', 'q', function() vim.cmd('bnext') end, {
        buffer = true, desc = 'Orgagenda exit', remap = false,
      })
      vim.keymap.set('n', '<C-[>', function() vim.cmd('bnext') end, {
        buffer = true, desc = 'Orgagenda exit', remap = false,
      })
      vim.keymap.set('n', '<CR>', function() orgmode.action('agenda.switch_to_item') end, {
        buffer = true, desc = 'Orgagenda switch to item',
      })
      vim.keymap.set('n', '<', function() orgmode.action('agenda.advance_span', -1) end, {
        buffer = true, desc = 'Orgagenda rewind span',
      })
      vim.keymap.set('n', '>', function() orgmode.action('agenda.advance_span', 1) end, {
        buffer = true, desc = 'Orgagenda advance span',
      })
    end,
  })

  vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'org', 'orgagenda', },
    callback = function()
      local orgmode = require('orgmode')

      -- <C-c>?
      vim.keymap.set('n', '<C-c>c', function() orgmode.action('agenda.open_by_key', 'c') end, {
        buffer = true, desc = 'Org Ended',
      })
      vim.keymap.set('n', '<C-c>m', function() orgmode.action('agenda.open_by_key', 'm') end, {
        buffer = true, desc = 'Org Today',
      })
      vim.keymap.set('n', '<C-c>n', function() orgmode.action('agenda.open_by_key', 'n') end, {
        buffer = true, desc = 'Org After',
      })
      vim.keymap.set('n', '<C-c>b', function() orgmode.action('agenda.open_by_key', 'b') end, {
        buffer = true, desc = 'Org Later',
      })
      vim.keymap.set('n', '<C-c>v', function() orgmode.action('agenda.open_by_key', 'v') end, {
        buffer = true, desc = 'Org Never',
      })
    end,
  })
end
