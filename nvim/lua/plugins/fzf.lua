return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  cmd = { 'FzfLua' },
  ---@module 'fzf-lua'
  ---@type fzf-lua.Config
  opts = {
    'max-perf',
  },
  config = function(opts)
    require('fzf-lua').setup(opts)
    require('fzf-lua').register_ui_select()
  end,
}
