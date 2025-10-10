return {
  's1n7ax/nvim-window-picker',
  version = '2.*',
  config = function()
    require('window-picker').setup {
      hint = 'statusline-winbar',
      selection_chars = 'ABCDEFGHIJKLMNOP',
      filter_rules = {
        include_current_win = false,
        autoselect_one = true,
        bo = {
          filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
          buftype = { 'terminal', 'quickfix' },
        },
      },
    }
  end,
}
