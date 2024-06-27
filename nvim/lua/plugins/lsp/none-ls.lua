local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.erb_lint,
    null_ls.builtins.diagnostics.rubocop,
    null_ls.builtins.diagnostics.fish,


    null_ls.builtins.formatting.erb_lint,
    null_ls.builtins.formatting.rubocop
  }
})
