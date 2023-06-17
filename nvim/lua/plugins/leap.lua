local status, leap = pcall(require, "leap")
if (not status) then
  print("[LS] leap status: " .. vim.inspect(status))
  return
end

leap.add_default_mappings()
