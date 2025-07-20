vim.diagnostic.config({
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = 'X',
      [vim.diagnostic.severity.WARN] = '!',
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
    },
    numhl = {
      [vim.diagnostic.severity.WARN] = 'WarningMsg',
    },
  },
})
