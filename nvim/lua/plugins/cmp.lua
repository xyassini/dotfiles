return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  event = 'VeryLazy',

  version = '1.*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'default',

      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide', 'fallback' },

      ['<Tab>'] = {
        'accept',
        function() -- sidekick next edit suggestion
          return require('sidekick').nes_jump_or_apply()
        end,
        'fallback',
      },
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
      ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

      ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

      ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
    },

    appearance = {
      nerd_font_variant = 'mono',
    },

    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 800, treesitter_highlighting = true },
    },

    cmdline = {
      enabled = true,
      completion = { menu = { auto_show = true } },
    },

    sources = {
      default = { 'lazydev', 'lsp', 'path', 'snippets' },
      providers = {
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
      },
    },

    signature = { enabled = true },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information

    fuzzy = { implementation = 'prefer_rust_with_warning' },
  },
  opts_extend = { 'sources.default' },
}

-- return {
--   'hrsh7th/nvim-cmp',
--   event = 'InsertEnter',
--   dependencies = {
--     'hrsh7th/cmp-nvim-lsp',
--     'hrsh7th/cmp-path',
--   },
--   config = function()
--     local cmp = require 'cmp'
--
--     cmp.setup {
--       sources = cmp.config.sources {
--         { name = 'lazydev', group_index = 0 },
--         { name = 'supermaven' },
--         { name = 'nvim_lsp' },
--         { name = 'path' },
--       },
--       mapping = {
--         ['<Up>'] = cmp.mapping.select_prev_item(),
--         ['<Down>'] = cmp.mapping.select_next_item(),
--         ['<Left>'] = cmp.mapping.scroll_docs(-4),
--         ['<Right>'] = cmp.mapping.scroll_docs(4),
--
--         ['<C-ESC>'] = cmp.mapping.close(),
--         ['<Tab>'] = cmp.mapping(function(fallback)
--           -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
--           if cmp.visible() then
--             local entry = cmp.get_selected_entry()
--             if not entry then
--               cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
--             else
--               cmp.confirm()
--             end
--           else
--             fallback()
--           end
--         end, { 'i', 's', 'c' }),
--       },
--     }
--
--     local capabilities = require('cmp_nvim_lsp').default_capabilities()
--
--     vim.lsp.config('*', {
--       capabilities = capabilities,
--     })
--   end,
-- }
