vim.diagnostic.config {
  virtual_text = {
    spacing = 1,
    severity_limit = 'Warning',
  },
  underline = true,
  update_in_insert = true,
  severity_sort = true,
  float = {
    source = true,
    focusable = false,
    severity_sort = true,
    border = 'rounded',
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = 'x',
      [vim.diagnostic.severity.WARN] = '!',
      [vim.diagnostic.severity.INFO] = 'i',
      [vim.diagnostic.severity.HINT] = '?',
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
    },
    numhl = {
      [vim.diagnostic.severity.WARN] = 'WarningMsg',
    },
  },
}
