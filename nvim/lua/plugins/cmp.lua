local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  print("[LS] cmp_status: " .. vim.inspect(cmp_status))
  return
end

local types = require("cmp.types")

local snip_status, luasnip = pcall(require, "luasnip")
if not snip_status then
  print("[LS] snip_status: " .. vim.inspect(snip_status))
  return
end

local copilot_status, copilot_cmp_comparators = pcall(require, "copilot_cmp.comparators")
if not copilot_status then
  print("[LS] copilot_status: " .. vim.inspect(copilot_status))
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

-- ╭──────────────────────────────────────────────────────────╮
-- │ Utils                                                    │
-- ╰──────────────────────────────────────────────────────────╯
local function deprioritize_snippet(entry1, entry2)
  if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then
    return false
  end
  if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then
    return true
  end
end

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

-- ╭──────────────────────────────────────────────────────────╮
-- │ Setup                                                    │
-- ╰──────────────────────────────────────────────────────────╯

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

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
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
    fields = { "menu", "abbr", "kind" },
    format = function(entry, vim_item)
      vim_item.menu = ({
        npm = "npm",
        Copilot = "ﮧ",
        nvim_lsp = "",
        buffer = "",
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
    {
      name = "nvim_lsp",
      priority = 10,
      entry_filter = limit_lsp_types,
    },
    { name = "npm",      priority = 9 },
    { name = "copilot",  priority = 9 },
    { name = "luasnip",  priority = 7, max_item_count = 5 },
    { name = "buffer",   priority = 7, keyword_length = 5, option = buffer_option, max_item_count = 5 },
    { name = "nvim_lua", priority = 5 },
    { name = "path",     priority = 4 },
    { name = "calc",     priority = 3 },
  },
  sorting = {
    comparators = {
      deprioritize_snippet,
      cmp.config.compare.exact,
      cmp.config.compare.locality,
      copilot_cmp_comparators.prioritize or function() end,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.offset,
      cmp.config.compare.sort_text,
      cmp.config.compare.order,
    },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    completion = cmp.config.window.bordered({
      winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
    }),
    documentation = cmp.config.window.bordered({
      winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
    }),
  },
  experimental = {
    ghost_text = true,
  },
})
