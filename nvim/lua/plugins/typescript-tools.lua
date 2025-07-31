return {
  'pmizio/typescript-tools.nvim',
  ft = {
    'typescript',
    'typescriptreact',
    'typescript.tsx',
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'svelte',
    'astro',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'neovim/nvim-lspconfig',
  },
  opts = {
    expose_as_code_action = 'all',
    complete_function_calls = true,
    include_completions_with_insert_text = true,
  },
  config = function(_, opts)
    -- vim.lsp.enable('ts_ls', false)
    -- require('typescript-tools').setup(opts)

  end,
}
