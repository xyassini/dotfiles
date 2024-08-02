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
    -- Skip since we use typescript-tools.nvim
  end,

  ["rust_analyzer"] = function()
    -- Skip since we use rustaceanvim
  end,

  ["tailwindcss"] = function()
    require("lspconfig").tailwindcss.setup({
      capabilities = capabilities,
      root_dir = require("lspconfig/util").root_pattern("tailwind.config.{js,ts,mjs,cjs}"),
    })
  end,
})
