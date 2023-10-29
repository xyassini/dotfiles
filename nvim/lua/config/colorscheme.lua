local status, tokyonight = pcall(require, "tokyonight")
-- local status, oxocarbon = pcall(require, "oxocarbon")


if not status then
  return
end

local isDarkMode = true

local function darkTheme()
  isDarkMode = true
  vim.g.tokyonight_transparent_sidebar = true
  vim.g.tokyonight_transparent = true
  vim.opt.background = "dark"

  tokyonight.setup({
    style = "night",
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  })

  vim.cmd("colorscheme tokyonight")
end

local function lightTheme()
  isDarkMode = false
  vim.g.tokyonight_transparent_sidebar = false
  vim.g.tokyonight_transparent = false
  vim.opt.background = "light"

  tokyonight.setup({
    style = "day",
    transparent = false,
    styles = {
      sidebars = "day",
      floats = "day",
    },
  })

  vim.cmd("colorscheme tokyonight")
end

function ToggleTheme()
  if isDarkMode then
    lightTheme()
  else
    darkTheme()
  end
end

darkTheme()
