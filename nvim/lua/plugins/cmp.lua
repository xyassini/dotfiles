return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
  },
  config = function()
    local cmp = require 'cmp'

    cmp.setup {
      sources = cmp.config.sources {
        { name = 'lazydev', group_index = 0 },
        { name = 'supermaven' },
        { name = 'nvim_lsp' },
        { name = 'path' },
      },
      mapping = {
        ['<Up>'] = cmp.mapping.select_prev_item(),
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<Left>'] = cmp.mapping.scroll_docs(-4),
        ['<Right>'] = cmp.mapping.scroll_docs(4),

        ['<C-ESC>'] = cmp.mapping.close(),
        ['<Tab>'] = cmp.mapping(function(fallback)
          -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
          if cmp.visible() then
            local entry = cmp.get_selected_entry()
            if not entry then
              cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
            else
              cmp.confirm()
            end
          else
            fallback()
          end
        end, { 'i', 's', 'c' }),
      },
    }

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    vim.lsp.config('*', {
      capabilities = capabilities,
    })
  end,
}
