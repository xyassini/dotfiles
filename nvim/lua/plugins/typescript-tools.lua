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
  config = function(_, opts)
    vim.lsp.enable('ts_ls', false)

    require('typescript-tools').setup {
      -- capabilities = require('blink.cmp').get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }
  end,
}
