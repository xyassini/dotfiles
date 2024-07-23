return {
  "rgroli/other.nvim",
  event = "VeryLazy",
  opts = {
    mappings = {
      "angular",
      "rails"
    }
  },
  config = function(opts)
    require("other-nvim").setup(opts)
  end
}
