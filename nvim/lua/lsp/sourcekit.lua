vim.lsp.config('sourcekit', {
  cmd = { vim.trim(vim.fn.system 'xcrun -f sourcekit-lsp') },
})
