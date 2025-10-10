return {
  'wojciech-kulik/xcodebuild.nvim',
  ft = 'swift',
  dependencies = {
    { 'nvim-telescope/telescope.nvim', lazy = true },
    'MunifTanjim/nui.nvim',
    {
      'https://github.com/wojciech-kulik/snacks.nvim',
      opts = {
        image = {
        },
      },
    },
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
