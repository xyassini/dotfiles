local isDarkMode = true

local function darkTheme()
  isDarkMode = true
  vim.g.tokyonight_transparent_sidebar = true
  vim.g.tokyonight_transparent = true
  vim.opt.background = "dark"

  require("tokyonight").setup({
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

  require("tokyonight").setup({
    style = "day",
    transparent = false,
    styles = {
      sidebars = "light",
      floats = "light",
    },
  })

  vim.cmd("colorscheme tokyonight-day")
end

function ToggleTheme()
  if isDarkMode then
    lightTheme()
  else
    darkTheme()
  end
end

darkTheme()
