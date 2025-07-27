return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = true,
  init = function()
    vim.api.nvim_create_autocmd({ 'BufWinEnter', 'BufNewFile' }, {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
