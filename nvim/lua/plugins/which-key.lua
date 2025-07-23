return {
  'folke/which-key.nvim',
  ---@module "which-key",
  ---@type wk.Opts
  opts = {
    preset = 'helix',
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show { global = false }
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
}
