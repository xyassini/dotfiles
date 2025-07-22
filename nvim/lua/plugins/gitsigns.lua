return {
  'lewis6991/gitsigns.nvim',
  event = "BufWinEnter",
  config = function()
    require('gitsigns').setup {
      signs = {
        add = { text = '┃' },
        change = { text = '┃' },
        delete = { text = '✖' },
        topdelete = { text = '✖' },
        changedelete = { text = '┃' },
        untracked = { text = '┆' },
      },
      numhl = false,
      linehl = false,
      word_diff = false,
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text_pos = 'eol',
        delay = 1000,
      },
      watch_gitdir = {
        follow_files = true,
      },
      auto_attach = true,
      attach_to_untracked = false,
    }
  end,
}
