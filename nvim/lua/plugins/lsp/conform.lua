require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    ruby = { "rubocop" },
    eruby = { "rubocop" },
    javascript = { { "prettierd", "prettier" } },
    typescript = { { "prettierd", "prettier" } },
    css = { { "prettierd", "prettier" } },
    html = { { "prettierd", "prettier" } },
    mjml = { { "prettierd", "prettier" } },
    svelte = { { "prettierd", "prettier" } },
    astro = { { "prettierd", "prettier" } },
  },
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
