return {
  'saghen/blink.cmp',
  event = 'InsertEnter',
  version = '1.*',
  dependencies = {
    {
      'fang2hou/blink-copilot',
      opts = {
        debounce = 100,
      },
    },
  },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    sources = {
      default = { 'lazydev', 'lsp', 'copilot', 'path', 'snippets' },
      providers = {
        lsp = {
          score_offset = 1,
        },
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          score_offset = 100,
        },
        copilot = {
          name = 'copilot',
          module = 'blink-copilot',
          score_offset = -1,
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
        blocked_trigger_characters = {},
        blocked_retrigger_characters = {},
        show_on_trigger_character = true,
        show_on_insert = true,
        show_on_insert_on_trigger_character = true,
      },
    },
    cmdline = {
      enabled = true,
      completion = { menu = { auto_show = true } },
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
        show_on_blocked_trigger_characters = {},
        show_on_x_blocked_trigger_characters = {},
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
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
}
