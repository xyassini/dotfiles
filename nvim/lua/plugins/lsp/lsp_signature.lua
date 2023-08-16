local status, lsp_signature = pcall(require, "lsp_signature")
if not status then
  print("[LS] lsp_signature status: " .. vim.inspect(status))
  return
end

lsp_signature.setup({})
