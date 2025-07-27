return {
  'wojciech-kulik/xcodebuild.nvim',
  ft = 'swift',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'MunifTanjim/nui.nvim',
    -- 'folke/snacks.nvim', -- (optional) to show previews
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    integrations = {
      pymobiledevice = {
        enabled = true,
      },
      xcodebuild_offline = {
        enabled = true,
      },
    },
  },
}
