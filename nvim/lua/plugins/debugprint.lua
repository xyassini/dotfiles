return {
  'andrewferrier/debugprint.nvim',
  version = '6.*',
  keys = {
    {
      '<leader>l',
      function()
        local word = vim.fn.expand '<cword>'
        if word and word ~= '' and word:match '^[%a_][%w_]*$' then
          -- Cursor is on a variable, use variable_below
          require('debugprint').debugprint { variable = true }
        else
          -- Cursor is not on a variable, use plain_below and move cursor
          require('debugprint').debugprint()
          vim.defer_fn(function()
            vim.cmd 'normal! $h'
            vim.cmd 'startinsert'
          end, 10)
        end
      end,
      desc = 'Debug print below (smart)',
      mode = 'n',
    },
    {
      '<leader>L',
      function()
        local word = vim.fn.expand '<cword>'
        if word and word ~= '' and word:match '^[%a_][%w_]*$' then
          -- Cursor is on a variable, use variable_above
          require('debugprint').debugprint { variable = true, above = true }
        else
          -- Cursor is not on a variable, use plain_above and move cursor
          require('debugprint').debugprint { above = true }
          vim.defer_fn(function()
            vim.cmd 'normal! $h'
            vim.cmd 'startinsert'
          end, 10)
        end
      end,
      desc = 'Debug print above (smart)',
      mode = 'n',
    },
  },
  opts = {
    move_to_debugline = true,
    keymaps = {
      normal = {
        -- Disable default keymaps to avoid conflicts
        plain_below = false,
        plain_above = false,
        variable_below = false,
        variable_above = false,
        variable_below_alwaysprompt = false,
        variable_above_alwaysprompt = false,
        surround_plain = false,
        surround_variable = false,
        surround_variable_alwaysprompt = false,
        textobj_below = false,
        textobj_above = false,
        textobj_surround = false,
        toggle_comment_debug_prints = false,
        delete_debug_prints = false,
      },
      insert = {
        plain = false,
        variable = false,
      },
      visual = {
        variable_below = '<leader>l',
        variable_above = '<leader>L',
      },
    },
  },
}
