return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- event = 'VeryLazy',
  cmd = { 'FzfLua' },
  config = function()
    require('fzf-lua').setup {
      'max-perf',
      previewers = {
        builtin = {
          snacks_image = {
            enabled = true,
            render_inline = true,
          },
        },
      },
    }
    require('fzf-lua').register_ui_select()
  end,
}
