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
  init = function()
    vim.lsp.enable('ts_ls', false)
  end,
}
