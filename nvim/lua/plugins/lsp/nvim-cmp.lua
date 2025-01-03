return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "LspAttach", "CmdlineEnter" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-calc",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "zbirenbaum/copilot.lua",
    "zbirenbaum/copilot-cmp",
    "David-Kunz/cmp-npm",
    "onsails/lspkind.nvim",
  },
  config = function()
    local cmp = require("cmp")
    require("copilot").setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
      copilot_node_command = 'bun'
    })

    require("copilot_cmp").setup()

    require("cmp-npm").setup({})

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      window = {
        completion = {
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
          col_offset = -3,
          side_padding = 0,
        },
        documentation = cmp.config.window.bordered(),
      },
      formatting = {
        expandable_indicator = true,
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          local kind = require("lspkind").cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            symbol_map = { Copilot = "" },
          })(entry, vim_item)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })

          kind.kind = " " .. (strings[1] or "") .. " "
          kind.menu = "  " .. (strings[2] or "") .. ""

          return kind
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        -- ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
          -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
          if cmp.visible() then
            local entry = cmp.get_selected_entry()
            if not entry then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            end
            cmp.confirm()
          else
            fallback()
          end
        end, { "i", "s", "c" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp_signature_help", group_index = 1 },
        { name = "nvim_lsp", group_index = 1 },
        { name = "copilot", max_item_count = 2, group_index = 2 },
        { name = "calc", group_index = 1 },
        { name = "path", group_index = 1 },
        { name = "lazydev", group_index = 1 },
        { name = "luasnip", group_index = 1 },
        { name = "npm" },
        -- {
        --   name = "buffer",
        --   max_item_count = 2,
        --   keyword_length = 2,
        --   option = {
        --     get_bufnrs = function()
        --       local buf = vim.api.nvim_get_current_buf()
        --       local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
        --       if byte_size > 1024 * 1024 then -- 1 Megabyte max
        --         return {}
        --       end
        --       return { buf }
        --     end,
        --   },
        -- },
      }),
      performance = {
        debounce = 0,
        throttle = 0,
        fetching_timeout = 50,
        confirm_resolve_timeout = 50,
        async_budget = 50,
        max_view_entries = 20,
      },
    })

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "nvim_lsp_document_symbol" },
      }, {
        { name = "buffer" },
      }),
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
      matching = { disallow_symbol_nonprefix_matching = false },
    })

    -- Auto insert `(` after function/method keyword
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#282C34", fg = "NONE" })
    vim.api.nvim_set_hl(0, "Pmenu", { fg = "#22252A" })

    vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
    vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true })

    vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#B5585F" })
    vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#B5585F" })
    vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#B5585F" })

    vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#9FBD73" })
    vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#9FBD73" })
    vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#9FBD73" })

    vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#D4BB6C" })
    vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#D4BB6C" })
    vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#D4BB6C" })

    vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#A377BF" })
    vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#A377BF" })
    vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#A377BF" })
    vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#A377BF" })
    vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#A377BF" })

    vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#7E8294" })
    vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#7E8294" })

    vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#D4A959" })
    vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#D4A959" })
    vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#D4A959" })

    vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#6C8ED4" })
    vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#6C8ED4" })
    vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#6C8ED4" })

    vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#58B5A8" })
    vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#58B5A8" })
    vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#58B5A8" })

    vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
  end,
}
