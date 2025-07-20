return {
  'nvim-neo-tree/neo-tree.nvim',
  cmd = 'Neotree',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    {
      's1n7ax/nvim-window-picker',
      version = '2.*',
      event = "VeryLazy",
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
    },
  },
  config = function()
    require('neo-tree').setup {
      auto_clean_after_session_restore = true,
      popup_border_style = '',
      enable_git_status = true,
      enable_diagnostics = true,
      window = {
        mappings = {
          ['<CR>'] = 'open_with_window_picker',
        },
      },
      buffers = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
      },
      filesystem = {
        hijack_netrw_behavior = 'disabled',
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
      },
    }
  end,
}
