vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },

  mapping = {
    ["<Up>"] = cmp.mapping.select_prev_item(),
    ["<Down>"] = cmp.mapping.select_next_item(),
    ["<Left>"] = cmp.mapping.scroll_docs(-4),
    ["<Right>"] = cmp.mapping.scroll_docs(4),

    ["<C-ESC>"] = cmp.mapping.close(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
      if cmp.visible() then
        local entry = cmp.get_selected_entry()
        if not entry then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        else
          cmp.confirm()
        end
      else
        fallback()
      end
    end, { "i", "s", "c" }),
  },

  formatting = {
    fields = {'menu', 'abbr', 'kind'}
  },

  sources = {
    { name = "nvim_lsp", max_item_count = 5 },
    { name = "buffer", max_item_count = 1 },
    { name = "copilot", max_item_count = 3 },
    { name = "luasnip", max_item_count = 2 },
    { name = "path", max_item_count = 2 },
    { name = "nvim_lua" },
  },
})
