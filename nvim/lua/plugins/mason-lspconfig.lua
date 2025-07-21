return {
  'mason-org/mason-lspconfig.nvim',
  event = { 'CursorHold', 'CursorHoldI' },
  cmd = { 'Mason', 'MasonInstall', 'MasonUninstall', 'MasonUpdate' },
  dependencies = {
    'mason-org/mason.nvim',
    'neovim/nvim-lspconfig',
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup()

    vim.lsp.config('*', {
      capabilities = vim.lsp.protocol.make_client_capabilities(),
    })
  end,
}
