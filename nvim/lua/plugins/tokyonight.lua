return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  ---@class require('tokyonight').Config
  ---@field on_colors fun(colors: ColorScheme)
  ---@field on_highlights fun(highlights: tokyonight.Highlights, colors: ColorScheme)
  opts = {
    style = 'night',
    light_style = 'day',
    dim_inactive = true, -- dims inactive windows
    ---@param colors ColorScheme
    on_colors = function(colors)
      colors.bg = '#000000'
      colors.bg_sidebar = '#000000'
      colors.bg_dark = '#000000'
      colors.bg_dark1 = '#000000'
      colors.bg_highlight = '#222222'
      colors.bg_float = '#000000'
      colors.bg_statusline = '#000000'
      colors.border = "#777777"
    end,
    ---@param highlights require('tokyonight').Highlights
    ---@param colors ColorScheme
    on_highlights = function(highlights, colors)
      -- colors.fg_dark
      highlights.StatusLine = {
        fg = '#000000',
        bg = '#FFFFFF',
        bold = true,
      }

      highlights.StatusLineNC = {
        fg = '#666666',
        bg = '#000000',
      }
    end,
  },
  init = function()
    vim.cmd.colorscheme 'tokyonight'
  end,
}
