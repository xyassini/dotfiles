vim.lsp.config('angularls', {
  filetypes = { 'typescript', 'html', 'typescriptreact', 'typescript.tsx', 'htmlangular' }
})

vim.cmd("TSBufEnable highlight")
