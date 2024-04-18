local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local capabilities = cmp_nvim_lsp.default_capabilities()

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    silent = true,
  }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help),
  ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    { virtual_text = true }
  ),
}

local on_attach = function(_, bufnr)
  require("lsp_signature").on_attach({}, bufnr)
end

local default_language_servers = {
  "emmet_ls",
  "bashls",
  "clangd",
  "cssls",
  "graphql",
  "html",
  "tailwindcss",
  "angularls",
  "dockerls",
  "vimls",
  "svelte",
  "astro"
}

for _, server in ipairs(default_language_servers) do
  lspconfig[server].setup({
    handlers = handlers,
    capabilities = capabilities,
    on_attach = on_attach
  })
end

lspconfig.tsserver.setup({
  handlers = handlers,
  capabilities = capabilities,
  on_attach = on_attach,
  settings = require("plugins.lsp.servers.tsserver").settings
})

lspconfig.eslint.setup({
  on_attach = require("plugins.lsp.servers.eslint").on_attach,
  handlers = handlers,
  capabilities = capabilities,
  settings = require("plugins.lsp.servers.eslint").settings
})

lspconfig.yamlls.setup({
  handlers = handlers,
  capabilities = capabilities,
  on_attach = on_attach,
  settings = require("plugins.lsp.servers.yamlls").settings
})

lspconfig.lua_ls.setup({
  handlers = handlers,
  capabilities = capabilities,
  on_attach = on_attach,
  settings = require("plugins.lsp.servers.lua_ls").settings
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>,', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>b', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>n', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<C-Enter>', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
