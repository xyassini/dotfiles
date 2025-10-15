return {
  'Wansmer/treesj',
  keys = {
    {
      ',',
      function()
        require('treesj').toggle()
      end,
    },
  },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  opts = {
    use_default_keymaps = false,
  },
}
