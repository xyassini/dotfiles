vim.diagnostic.config {
  virtual_text = {
    spacing = 1,
    severity_limit = 'Warning',
  },
  underline = true,
  update_in_insert = false,
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
    numhl = {
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
      [vim.diagnostic.severity.WARN] = 'WarningMsg',
    },
  },
}
