local status, typescript = pcall(require, "typescript")
if not status then
  return
end

typescript.setup({
  disable_commands = true,
  server = {
    capabilities = require("lsp.servers.tsserver").capabilities,
    handlers = require("lsp.servers.tsserver").handlers,
    on_attach = require("lsp.servers.tsserver").on_attach,
    settings = require("lsp.servers.tsserver").settings,
  },
})

