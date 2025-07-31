return {
  'mason-org/mason-lspconfig.nvim',
  event = { 'FileType' },
  opts = {},
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'neovim/nvim-lspconfig',
  },
}
