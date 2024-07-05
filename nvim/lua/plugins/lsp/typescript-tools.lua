local baseDefinitionHandler = vim.lsp.handlers["textDocument/definition"]

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    silent = true,
  }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help),
  ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    { virtual_text = true }
  )
}

require("typescript-tools").setup({
  on_attach = function(client, bufnr)
    -- Enable inlay hints
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end,
  handlers = handlers,
  settings = {
    separate_diagnostic_server = true,
    code_lens = "off",
    tsserver_file_preferences = {
      includeInlayParameterNameHints = "all",
      includeCompletionsForModuleExports = true,
      quotePreference = "auto",
    },
  },
})
