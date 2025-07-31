return {
  'j-hui/fidget.nvim',
  event = 'BufReadPre',
  opts = {
    notification = {
      window = {
        normal_hl = 'Normal',
        winblend = 0,
      },
    },
    integration = {
      ['xcodebuild-nvim'] = {
        enable = false,
      },
    },
  },
}
