return {
  "rgroli/other.nvim",
  event = "VeryLazy",
  config = function()
    require("other-nvim").setup({
      mappings = {
        "angular",
        "rails",
      },
    })
  end,
}
