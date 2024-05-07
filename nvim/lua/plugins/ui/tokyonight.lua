local tokyonight = require('tokyonight')

tokyonight.setup({
  style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
  day_brightness = 0.23,
  on_colors = function(colors)
    colors.bg_dark = "#000000"
    colors.bg = "#000000"
    colors.bg_highlight = "#1a1b26"
  end
})

vim.cmd("colorscheme tokyonight")

if vim.fn.has('macunix') == 1 then
  local handle = io.popen("defaults read -g AppleInterfaceStyle")
  local result = handle:read("*a")
  handle:close()

  if string.match(result, "^Dark") then
    vim.opt.background = "dark"
  else
    vim.opt.background = "light"
  end
end

