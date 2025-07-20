return {
  'lewis6991/gitsigns.nvim',
  event = "VeryLazy",
  config = function()
    require("gitsigns").setup({
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
    })
  end

}
