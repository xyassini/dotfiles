vim.lsp.enable 'sourcekit'

vim.lsp.enable('ts_ls', false)
require('typescript-tools').setup {
  expose_as_code_action = 'all',
  complete_function_calls = true,
  include_completions_with_insert_text = true,
}

