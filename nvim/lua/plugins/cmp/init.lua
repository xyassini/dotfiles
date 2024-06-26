vim.opt.completeopt = {'menu', 'menuone', 'noselect'}


local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

local function limit_lsp_types(entry, ctx)
  local kind = entry:get_kind()
  local line = ctx.cursor.line
  local col = ctx.cursor.col
  local char_before_cursor = string.sub(line, col - 1, col - 1)
  local char_after_dot = string.sub(line, col, col)

  if char_before_cursor == "." and char_after_dot:match("[a-zA-Z]") then
    if
        kind == types.lsp.CompletionItemKind.Method
        or kind == types.lsp.CompletionItemKind.Field
        or kind == types.lsp.CompletionItemKind.Property
    then
      return true
    else
      return false
    end
  elseif string.match(line, "^%s+%w+$") then
    if kind == types.lsp.CompletionItemKind.Function or kind == types.lsp.CompletionItemKind.Variable then
      return true
    else
      return false
    end
  end

  return true
end

local buffer_option = {
  -- Complete from all visible buffers (splits)
  get_bufnrs = function()
    local bufs = {}
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      bufs[vim.api.nvim_win_get_buf(win)] = true
    end
    return vim.tbl_keys(bufs)
  end,
}

local kind_icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰇽",
  Variable = "󰂡",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲",
}

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
    fields = {'menu', 'abbr', 'kind'},
    format = function(entry, vim_item)
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
      vim_item.menu = ({
        npm = "npm",
        Copilot = "ﮧ",
        nvim_lsp = "",
        buffer = "",
        nvim_lua = "",
        luasnip = "",
        calc = "",
        path = "",
        treesitter = "",
        zsh = "",
      })[entry.source.name]
      return vim_item
    end,
  },

  sources = {
    { name = "nvim_lsp", max_item_count = 5, entry_filter = limit_lsp_types },
    { name = "buffer", max_item_count = 3, option = buffer_option },
    { name = "copilot", max_item_count = 3 },
    { name = "luasnip", max_item_count = 2 },
    { name = "path", max_item_count = 2 },
    { name = "nvim_lua" },
  },

  sorting = {
    comparators = {
      cmp.config.compare.exact,
      cmp.config.compare.locality,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.offset,
      cmp.config.compare.sort_text,
      cmp.config.compare.order,
    },
  }
})
