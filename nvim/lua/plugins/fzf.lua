return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  ---@module 'fzf-lua'
  ---@type fzf-lua.Config
  opts = {
    "max-perf"
  },
  config = function ()
    require("fzf-lua").register_ui_select()
  end
}
