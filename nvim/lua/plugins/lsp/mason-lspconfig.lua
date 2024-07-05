require("mason-lspconfig").setup({
  ensure_installed = {"lua_ls", "emmet_ls", "graphql", "html", "angularls", "dockerls", "svelte", "astro", "tailwindcss", "bashls", "cssls", "eslint", "jsonls", "prismals", "tsserver"},
  automatic_installation = true
})
