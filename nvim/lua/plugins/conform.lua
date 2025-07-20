return {
  'stevearc/conform.nvim',
  keys = { "ö" },
  cmd = {
    "Conform",
    "ConformInfo",
    "ConformEnable",
    "ConformDisable",
    "ConformToggle",
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettierd", "pretier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      css = { "prettierd", "prettier", stop_after_first = true },
      html = { "prettierd", "prettier", stop_after_first = true },
      svelte = { "prettierd", "prettier", stop_after_first = true },
      astro = { "prettierd", "prettier", stop_after_first = true },
    }
  },
}
