return {
  'nvim-treesitter/nvim-treesitter',
  event = "LspAttach",
  branch = 'main',
  build = ':TSUpdate'
}
