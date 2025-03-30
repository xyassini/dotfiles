return {
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  event = "BufRead",
  cmd = "Mason",
  dependencies = { 'saghen/blink.cmp' },
}
