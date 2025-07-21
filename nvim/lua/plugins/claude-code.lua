return {
  'greggh/claude-code.nvim',
  keys = {
    {
      mode = 'n', -- Normal and terminal mode
      '<leader>c', -- Keymap to toggle Claude Code'
    },
  },
  cmd = 'ClaudeCode',
  dependencies = {
    'nvim-lua/plenary.nvim', -- Required for git operations
  },
  config = function()
    require('claude-code').setup {
      window = {
        position = 'float',
      },
      keymaps = {
        toggle = {
          normal = '<leader>c', -- Normal mode keymap for toggling Claude Code, false to disable
          terminal = false,
          variants = {
            continue = '<C-l>', -- Normal mode keymap for Claude Code with continue flag
            verbose = '<C-c>', -- Normal mode keymap for Claude Code with verbose flag
          },
        },
        window_navigation = true,
        scrolling = true,
      },
    }
  end,
}
