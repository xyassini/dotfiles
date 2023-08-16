local status, notify = pcall(require, "notify")
if not status then
  print("Notify plugin status: " .. vim.inspect(status))
  return
end

vim.notify = notify
