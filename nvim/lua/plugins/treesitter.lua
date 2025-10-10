return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    local treesitter = require 'nvim-treesitter'
    treesitter.setup {
      ensure_installed = {
        'lua',
        'markdown',
        'markdown_inline',
        'html',
        'svelte',
        'javascript',
        'typescript',
        'jsx',
        'tsx',
        'json',
        'yaml',
        'astro',
        'css',
        'scss',
        'bash',
        'fish',
        'swift',
        'csv',
        'gitcommit',
        'gitignore',
        'embedded_template',
        'make',
        'jsdoc',
        'kitty',
        'luadoc',
        'nginx',
        'ruby',
        'regex',
        'ssh_config',
        'vim',
        'vimdoc',
        'toml',
      },
      highlight = {
        enable = true,
      },
    }

    vim.api.nvim_create_autocmd('BufReadPost', {
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
