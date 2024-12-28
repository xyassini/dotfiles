return {
  "nvim-telescope/telescope.nvim",
  -- tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "MunifTanjim/nui.nvim",
  },
  event = "VeryLazy",
  config = function()
    require("telescope").setup({
      defaults = vim.tbl_extend("force", require("custom.utils.telescope_layout"), {
        selection_strategy = "closest",
        prompt_prefix = "",
        path_display = {
          truncate = 3,
        },
        mappings = {
          i = {
            ["<S-Down>"] = require("telescope.actions").cycle_history_next,
            ["<S-Up>"] = require("telescope.actions").cycle_history_prev,
          },
        },
        preview = {
          filesize_limit = 2,
        },
        file_ignore_patterns = {
          ".git/",
          "yarn.lock",
          "bun.lockb",
          "package-lock.json",
          "node_modules/",
        },
      }),
      builtin = {
        live_grep = {},
      },
    })
    require("telescope").load_extension("fzf")
  end,
}
