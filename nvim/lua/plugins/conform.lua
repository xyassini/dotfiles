return {
  'stevearc/conform.nvim',
  keys = {
    {
      'ö',
      function()
        require('conform').format { lsp_fallback = true }
      end,
      desc = 'Format Code',
    },
  },
  config = function()
    require('conform').setup {
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'prettierd', 'prettier', stop_after_first = true },
        css = { 'prettierd', 'prettier', stop_after_first = true },
        html = { 'prettierd', 'prettier', stop_after_first = true },
        htmlangular = { 'prettierd', 'prettier', stop_after_first = true },
        svelte = { 'prettierd', 'prettier', stop_after_first = true },
        astro = { 'prettierd', 'prettier', stop_after_first = true },
        swift = { 'swiftformat' },
      },
    }

    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
