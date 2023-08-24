local status, lspsaga = pcall(require, "lspsaga")
if not status then
  print("lspsaga status: " .. vim.inspect(status))
end

lspsaga.setup({
  lightbulb = {
    enable = false,
  },
})
