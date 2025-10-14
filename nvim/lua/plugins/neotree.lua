return {
  'nvim-neo-tree/neo-tree.nvim',
  cmd = 'Neotree',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function()
    local function on_move(data)
      require('snacks').rename.on_rename_file(data.source, data.destination)
    end

    local events = require 'neo-tree.events'

    require('neo-tree').setup {
      event_handlers = {
        { event = events.FILE_MOVED, handler = on_move },
        { event = events.FILE_RENAMED, handler = on_move },
      },
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
