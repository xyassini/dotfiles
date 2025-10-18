---@diagnostic disable: missing-fields
vim.api.nvim_create_autocmd('User', {
  pattern = 'TSUpdate',
  callback = function()
    require('nvim-treesitter.parsers').haxe = {
      install_info = {
        url = 'https://github.com/vantreeseba/tree-sitter-haxe',
        files = { 'src/parser.c', 'src/scanner.c' },
        -- optional entries:
        branch = 'main',
      },
      filetype = 'haxe',
    }
  end,
})
