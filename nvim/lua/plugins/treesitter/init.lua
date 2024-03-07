require("nvim-treesitter.configs").setup({
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "svelte", "typescript", "javascript" },
  auto_install = true,

  highlight = {
    enable = true,
  },

  indent = {
    enable = true
  }
})
