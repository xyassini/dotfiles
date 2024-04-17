require("mason-lspconfig").setup({
  ensure_installed = {"lua_ls", "emmet_ls", "graphql", "html", "angularls", "dockerls", "svelte", "astro", "prettierd", "stylua", "rubocop"},
  automatic_installation = true
})
