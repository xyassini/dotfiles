require("mason-lspconfig").setup({
  ensure_installed = {"lua_ls", "emmet_ls", "graphql", "html", "angularls", "dockerls", "svelte", "astro"},
  automatic_installation = true
})
