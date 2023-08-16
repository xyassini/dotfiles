local status, treesitter = pcall(require, "nvim-treesitter.configs")
if (not status) then
  print("Error: Treesitter not installed.")
  return
end

treesitter.setup({
  ensure_installed = {
    "tsx",
    "typescript",
    "javascript",
    "html",
    "css",
    "scss",
    "vue",
    "astro",
    "svelte",
    "gitcommit",
    "graphql",
    "json",
    "json5",
    "lua",
    "markdown",
    "prisma",
    "vim",
  },
  sync_install = false,
  highlight = {
    enable = true,
  },

  indent = {
    enable = true
  },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
})
