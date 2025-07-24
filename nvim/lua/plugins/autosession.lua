return {
  'rmagatti/auto-session',
  lazy = false,
  config = function()
    require('auto-session').setup {
      auto_session_suppress_dirs = { '~/', '~/Desktop', '~/Downloads', '/', 'COMMIT_EDITMSG' },
      session_lens = {
        load_on_setup = false,
      },
    }

    vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
  end,
}
