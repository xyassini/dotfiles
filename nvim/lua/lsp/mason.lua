local mason_status, mason = pcall(require, "mason")
local mason_lsp_status, mason_lsp = pcall(require, "mason-lspconfig")

if not mason_status or not mason_lsp_status then
  print("[LS] mason_status: " .. vim.inspect(mason_status))
  print("[LS] mason_lsp_status: " .. vim.inspect(mason_lsp_status))
  return
end

mason.setup()

mason_lsp.setup({
  ensure_installed = {
    "bashls",
    "cssls",
    "eslint",
    "graphql",
    "html",
    "jsonls",
    "lua_ls",
    "prismals",
    "tailwindcss",
    "tsserver",
    "angularls",
    "svelte",
    "astro",
    "emmet_ls",
    "dockerls"
  },
  automatic_installation = true,
})

