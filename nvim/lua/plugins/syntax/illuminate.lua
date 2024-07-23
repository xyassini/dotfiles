return {
  "RRethy/vim-illuminate",
  event = "BufEnter",
  config = function()
    require("illuminate").configure({
      delay = 0,
      under_cursor = false,
      should_enable = function() return false end, -- Disable for now
    })
  end
}
