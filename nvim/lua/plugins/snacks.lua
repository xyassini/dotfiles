return {
  'https://github.com/wojciech-kulik/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = {
      enabled = true,
      bigfile = {
        notify = true,
        size = 2 * 1024 * 1024,
        line_length = 5000,
      },
    },
    lazygit = {},
    image = {},
    indent = {
      indent = {
        enabled = false,
      },
      scope = {
        enabled = true,
      },
    },
  },
}
