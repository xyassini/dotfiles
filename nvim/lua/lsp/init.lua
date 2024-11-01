require("mason").setup()
require("mason-lspconfig").setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason-lspconfig").setup_handlers({
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup({
      capabilities = capabilities
    })
  end,

  ["tsserver"] = function()
    -- Deprecated
    -- Skip since we use typescript-tools.nvim
  end,

  ["ts_ls"] = function()
    -- Skip since we use typescript-tools.nvim
  end,

  ["rust_analyzer"] = function()
    -- Skip since we use rustaceanvim
  end,


  -- Fix for NX monorepos
  ["angularls"] = function()
    require("lspconfig").angularls.setup({
      capabilities = capabilities,
      filetypes = { "typescript", "html", "tpescriptreact", "typescript.tsx", "htmlangular" },
      root_dir = require("lspconfig/util").root_pattern("angular.json", "project.json"),
    })
  end,

  ["tailwindcss"] = function()
    require("lspconfig").tailwindcss.setup({
      capabilities = capabilities,
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte", "html", "htmlangular" },
      root_dir = require("lspconfig/util").root_pattern("tailwind.config.{js,ts,mjs,cjs}"),
    })
  end,

  ["eslint"] = function()
    require("lspconfig").eslint.setup({
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte", "html", "htmlangular", "json" },
    })
  end,

  ["ruby_lsp"] = function()
    require("lspconfig").ruby_lsp.setup({
      capabilities = capabilities,
      init_options = {
        formatter = "rubocop",
        linters = { "rubocop" }
      }
    })
  end,
})
