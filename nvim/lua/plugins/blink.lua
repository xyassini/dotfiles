-- return {
--   'hrsh7th/nvim-cmp',
--   event = "InsertEnter",
--   dependencies = {
--     'hrsh7th/cmp-nvim-lsp',
--     -- 'hrsh7th/cmp-buffer',
--     'hrsh7th/cmp-path',
--     'hrsh7th/cmp-cmdline',
--     -- 'hrsh7th/cmp-copilot', -- use blink.cmp instead
--   },
--   opts = {
--
--   },
--   config = function()
--     vim.lsp.config('*', {
--       capabilities = require('cmp_nvim_lsp').default_capabilities()
--     })
--   end
-- }

return {
  -- {
  --   'saghen/blink.compat',
  --   -- use v2.* for blink.cmp v1.*
  --   version = '2.*',
  --   -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
  --   lazy = true,
  --   -- make sure to set opts so that lazy.nvim calls blink.compat's setup
  --   opts = {},
  -- },
  {
    'saghen/blink.cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    version = '1.*',
    dependencies = {
      {
        'fang2hou/blink-copilot',
        opts = {
          debounce = 200,
        },
      },
    },
    opts_extend = { 'sources.default' },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      sources = {
        default = {
          'lazydev',
          'lsp',
          'copilot',
          'path',
          -- 'avante_commands',
          -- 'avante_mentions',
          -- 'avante_shortcuts',
          -- 'avante_files',
        },
        providers = {
          -- avante_commands = {
          --   name = 'avante_commands',
          --   module = 'blink.compat.source',
          --   score_offset = 90, -- show at a higher priority than lsp
          --   opts = {},
          -- },
          -- avante_files = {
          --   name = 'avante_files',
          --   module = 'blink.compat.source',
          --   score_offset = 100, -- show at a higher priority than lsp
          --   opts = {},
          -- },
          -- avante_mentions = {
          --   name = 'avante_mentions',
          --   module = 'blink.compat.source',
          --   score_offset = 1000, -- show at a higher priority than lsp
          --   opts = {},
          -- },
          -- avante_shortcuts = {
          --   name = 'avante_shortcuts',
          --   module = 'blink.compat.source',
          --   score_offset = 1000, -- show at a higher priority than lsp
          --   opts = {},
          -- },
          lsp = {
            score_offset = 10,
          },
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            score_offset = 100,
          },
          copilot = {
            name = 'copilot',
            module = 'blink-copilot',
            score_offset = -100,
            async = true,
          },
        },
      },
      fuzzy = {
        sorts = {
          'exact',
          'score',
          'sort_text',
        },
      },
      keymap = {
        preset = 'default',

        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide', 'fallback' },

        ['<CR>'] = { 'accept', 'fallback' },
        ['<Tab>'] = { 'accept', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
        ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

        ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
      },
      signature = {
        enabled = true,
        trigger = {
          enabled = true,
          show_on_keyword = true,
          -- blocked_trigger_characters = {},
          -- blocked_retrigger_characters = {},
          show_on_trigger_character = true,
          show_on_insert = true,
          show_on_insert_on_trigger_character = true,
        },
      },
      cmdline = {
        enabled = true,
        completion = { menu = { auto_show = true } },
        keymap = {
          -- ['<CR>'] = { 'accept_and_enter', 'fallback' },
          ['<Up>'] = { 'select_prev', 'fallback' },
          ['<Down>'] = { 'select_next', 'fallback' },
        },
      },
      completion = {
        keyword = {
          range = 'prefix',
        },
        trigger = {
          prefetch_on_insert = true,
          show_on_backspace = true,
          show_on_backspace_in_keyword = true,
          show_on_insert = true,
          -- show_on_blocked_trigger_characters = {},
          -- show_on_x_blocked_trigger_characters = {},
        },
        documentation = {
          auto_show = true,
          -- auto_show_delay_ms = 200,
        },
        menu = {
          auto_show = true,
        },
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },
      },
    },
  },
}
