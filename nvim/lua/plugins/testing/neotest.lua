require("neotest").setup({
  adapters = {
    require("neotest-vitest"),
    require("neotest-jest"),
    require("neotest-playwright"),
  },
})
