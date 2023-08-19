local M = {}

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.offsetEncoding = { "utf-16" }

M.capabilities = capabilities

return M
