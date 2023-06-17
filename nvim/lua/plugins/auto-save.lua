local status, auto_save = pcall(require, "auto-save")
if not status then
  return
end

local config = require("user.config")

auto_save.setup({
  enabled = true,
  events = config.plugins.auto_save.events
})
