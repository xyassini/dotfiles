vim.lsp.config('sourcekit', {
  cmd = { vim.trim(vim.fn.system 'xcrun -f sourcekit-lsp') },
  capabilities = require('blink.cmp').get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities()),
})
