return {
  'j-hui/fidget.nvim',
  event = 'BufReadPre',
  opts = {
    notification = {
      override_vim_notify = true,

      window = {
        normal_hl = 'Normal',
        winblend = 0,
      },
    },
    integration = {
      ['xcodebuild-nvim'] = {
        enable = true,
      },
    },
  },
}
