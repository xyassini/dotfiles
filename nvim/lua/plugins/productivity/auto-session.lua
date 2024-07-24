return {
  {
    'rmagatti/auto-session',
    dependencies = {
      'nvim-telescope/telescope.nvim'
    },
    config = function()
      require("auto-session").setup({
        auto_session_suppress_dirs = { '~/', '~/Desktop', '~/Downloads', '/', 'NeogitStatus', 'COMMIT_EDITMSG' },
      })

      vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
    end
  },
}
