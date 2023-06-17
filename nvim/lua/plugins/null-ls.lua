local null_ls_status, null_ls = pcall(require, "null-ls")
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")

if not null_ls_status or not mason_null_ls_status then
  return
end

mason_null_ls.setup({
  ensure_installed = {},
  automatic_installation = false,
  automatic_setup = true,
  handlers = {},
})

null_ls.setup({
  sources = {
    require("null-ls").builtins.diagnostics.codespell.with({
      filetypes = { "markdown", "text" },
    }),
    require("typescript.extensions.null-ls.code-actions"),
  },
})
