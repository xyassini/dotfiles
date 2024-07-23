return {
  "nvim-neotest/neotest",
  event = "BufWinEnter",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-jest",
    "marilari88/neotest-vitest",
    "thenbe/neotest-playwright",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require('neotest-vitest'),
        require('neotest-jest'),
        require('neotest-playwright'),
      }
    })
  end
}
