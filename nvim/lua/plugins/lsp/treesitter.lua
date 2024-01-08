local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
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
    "c",
    "toml",
    "sql",
    "rust",
    "jsdoc",
    "gitignore",
    "fish",
    "dockerfile",
    "comment",
    "arduino",
    "cmake",
    "cpp",
    "make",
    "markdown_inline",
    "python",
    "yaml",
    "xml",
  },
  sync_install = false,
  highlight = {
    enable = true,
  },

  indent = {
    enable = true,
  },

  context_commentstring = {
    enable_autocmd = false,
  },
})
