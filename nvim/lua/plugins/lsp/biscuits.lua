local status, biscuits = pcall(require, "nvim-biscuits")
if not status then
  return
end

biscuits.setup({
  cursor_line_only = true,
})
