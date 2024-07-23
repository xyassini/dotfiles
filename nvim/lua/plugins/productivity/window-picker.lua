return {
  's1n7ax/nvim-window-picker',
  name = 'window-picker',
  event = 'VeryLazy',
  version = '2.*',
  opts = {
    hint = 'statusline-winbar',
    selection_chars = 'ABCDEFGHIJKLMNOP',
    highlights = {
      statusline = {
        focused = {
          fg = '#ffffff',
          bg = '#c03e0f',
          bold = true,
        },
        unfocused = {
          fg = '#ffffff',
          bg = '#33456a',
          bold = true,
        },
      },
      winbar = {
        focused = {
          fg = '#ffffff',
          bg = '#c03e0f',
          bold = true,
        },
        unfocused = {
          fg = '#ffffff',
          bg = '#33456a',
          bold = true,
        },
      },
    }
  }
}
