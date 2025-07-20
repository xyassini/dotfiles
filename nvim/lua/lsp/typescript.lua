vim.lsp.enable('ts_ls', false)

require('typescript-tools').setup {
  capabilities = require('blink.cmp').get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities()),
}
