return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    auto_clean_after_session_restore = true,
    popup_border_style = "rounded",
    window = {
      mappings = {
        ["<CR>"] = "open_with_window_picker",
      },
    },
    filesystem = {
      hijack_netrw_behavior = "disabled",
      use_libuv_file_watcher = true,

      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
    },
  },
}
