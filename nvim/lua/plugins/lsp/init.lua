require("lsp-zero")
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

local on_attach = function (client, bufnr)
  require("lsp_signature").on_attach({}, bufnr)
end

local default_language_servers = {
  "emmet_ls",
  "lua_ls",
  "graphql",
  "html",
  "angularls",
  "dockerls",
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


lspconfig.eslint.setup({
  on_attach = require("plugins.lsp.servers.eslint").on_attach,
  handlers = handlers,
  capabilities = capabilities
})

