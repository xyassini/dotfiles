return {
  'copilotlsp-nvim/copilot-lsp',
  event = "VeryLazy",
  init = function()
    -- vim.g.copilot_nes_debounce = 500
    vim.lsp.enable 'copilot_ls'
  end,
}
