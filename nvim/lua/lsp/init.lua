require("lsp.config")
require("lsp.mason")
require("lsp.typescript")

local lsp_status, lspconfig = pcall(require, "lspconfig")
if not lsp_status then
  print("[LS] lsp_status: " .. vim.inspect(lsp_status))
  return
end

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    silent = true,
  }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help),
  ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    { virtual_text = true }
  ),
}

local function on_attach(client, bufnr)
  -- set up buffer keymaps, etc.
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  print("[LS] cmp_nvim_lsp_status: " .. vim.inspect(cmp_nvim_lsp_status))
  return
end

local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig.tailwindcss.setup({
  capabilities = require("lsp.servers.tailwindcss").capabilities,
  filetypes = require("lsp.servers.tailwindcss").filetypes,
  handlers = handlers,
  init_options = require("lsp.servers.tailwindcss").init_options,
  on_attach = require("lsp.servers.tailwindcss").on_attach,
  settings = require("lsp.servers.tailwindcss").settings,
  root_dir = require("lsp.servers.tailwindcss").root_dir,
})

lspconfig.cssls.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = require("lsp.servers.cssls").on_attach,
  settings = require("lsp.servers.cssls").settings,
})

lspconfig.eslint.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = require("lsp.servers.eslint").on_attach,
  settings = require("lsp.servers.eslint").settings,
})

lspconfig.jsonls.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  settings = require("lsp.servers.jsonls").settings,
})

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  settings = require("lsp.servers.lua_ls").settings,
})

lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  handlers = handlers,
  filetypes = { "rust" },
  settings = require("lsp.servers.rust_analyzer").settings,
})

for _, server in ipairs({ "bashls", "emmet_ls", "graphql", "html", "prismals", "angularls", "emmet_ls", "dockerls", "svelte" }) do
  lspconfig[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers,
  })
end
