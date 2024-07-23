return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,

  config = function()
    require("tokyonight").setup({
      style = "night",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      light_style = "day",    -- The theme is used when the background is set to light
      transparent = true,
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
      day_brightness = 0.23,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_colors = function(colors)
        colors.bg_dark = "#000000"
        colors.bg = "#000000"
        colors.bg_highlight = "#1a1b26"
      end
    })

    vim.g.tokyonight_transparent_sidebar = true
    vim.g.tokyonight_transparent = true
    vim.opt.background = "dark"

    vim.cmd("colorscheme tokyonight")
  end
}
