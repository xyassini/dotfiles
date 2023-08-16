local status, other = pcall(require, "other-nvim")
if (not status) then
  return
end

other.setup({
  mappings = {
    "rails",
    "angular",
    "golang"
  }
})

