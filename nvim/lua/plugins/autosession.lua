return {
  'rmagatti/auto-session',
  lazy = true,
  config = function()
    require('auto-session').setup {
      auto_session_suppress_dirs = { '~/', '~/Desktop', '~/Downloads', '/', 'COMMIT_EDITMSG' },
      session_lens = {
        load_on_setup = false,
      },
    }
  end,
}
