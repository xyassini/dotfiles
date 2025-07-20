return {
  'rgroli/other.nvim',
  keys = {
    { '<leader>o', '<cmd>Other<cr>', desc = 'Open other file' },
  },
  config = function()
    require('other-nvim').setup {
      mappings = {
        'livewire',
        'angular',
        'laravel',
        'rails',
        'golang',
        'python',
        'react',
        'rust',
        'elixir',
        'clojure',
      },
    }
  end,
}
