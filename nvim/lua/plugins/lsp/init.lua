local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local capabilities = cmp_nvim_lsp.default_capabilities()

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

local on_attach = function(_, bufnr)
  require("lsp_signature").on_attach({}, bufnr)
end

local default_language_servers = {
  "emmet_ls",
  "bashls",
  "clangd",
  "cssls",
  "graphql",
  "html",
  "tailwindcss",
  "angularls",
  "dockerls",
  "vimls",
  "svelte",
  "astro"
}

for _, server in ipairs(default_language_servers) do
  lspconfig[server].setup({
    handlers = handlers,
    capabilities = capabilities,
    on_attach = on_attach
  })
end

lspconfig.tsserver.setup({
  handlers = handlers,
  capabilities = capabilities,
  on_attach = on_attach,
  settings = require("plugins.lsp.servers.tsserver").settings
})

lspconfig.eslint.setup({
  on_attach = require("plugins.lsp.servers.eslint").on_attach,
  handlers = handlers,
  capabilities = capabilities,
  settings = require("plugins.lsp.servers.eslint").settings
})

lspconfig.yamlls.setup({
  handlers = handlers,
  capabilities = capabilities,
  on_attach = on_attach,
  settings = require("plugins.lsp.servers.yamlls").settings
})

lspconfig.lua_ls.setup({
  handlers = handlers,
  capabilities = capabilities,
  on_attach = on_attach,
  settings = require("plugins.lsp.servers.lua_ls").settings
})
