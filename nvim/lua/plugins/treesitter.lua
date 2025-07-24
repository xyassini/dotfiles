-- return {
--   'nvim-treesitter/nvim-treesitter',
--   event = 'LspAttach',
--   branch = 'master',
--   build = ':TSUpdate',
-- }

return {
  'nvim-treesitter/nvim-treesitter',
  event = { "BufRead", "BufNewFile" },
  branch = 'main',
  build = ':TSUpdate',
}
