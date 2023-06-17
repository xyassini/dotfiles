local status, colorizer = pcall(require, "colorizer")
if not status then
  print("[LS] status: " .. vim.inspect(status))
  return
end

colorizer.setup({
  filetypes = {
    "html",
    "css",
    "scss",
    "javascript",
    "typescript",
    "typescriptreact",
    "javascriptreact",
  },
  user_default_options = {
    mode = "background",
    tailwind = false,
  },
})
