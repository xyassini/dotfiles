local nnoremap = require("utils.remap").nnoremap
local nmap = require("utils.remap").nmap

-- File Tree
nnoremap("<leader>e", "<cmd>NvimTreeToggle<CR>") -- Toggle
nnoremap("±", "<cmd>NvimTreeResize +5<CR>") -- Increase width
nnoremap("–", "<cmd>NvimTreeResize -5<CR>") -- Decrease width

-- Fuzzy find files
nnoremap("<C-p>", "<cmd>lua require('telescope.builtin').find_files()<CR>")
-- Greo in all files
nnoremap("<C-f>", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
-- Show all recent buffers
nnoremap("<C-b>", "<cmd>lua require('telescope.builtin').buffers()<CR>")
-- Show all files from git status
nnoremap("<C-g>", "<cmd>lua require('telescope.builtin').git_status()<CR>")
-- Project Picker
nnoremap("<leader>p", "<cmd>lua require('telescope').extensions.projects.projects()<cr>")

-- Other.nvim mappings
nnoremap("<leader>o", "<cmd>Other<CR>")
nnoremap("<leader><Down>", "<cmd>OtherSplit<CR>")
nnoremap("<leader><Right>", "<cmd>OtherVSplit<CR>")

-- Move through panes in light speed (at least on a German keyboard)
nnoremap("+", "<C-w>l")
nnoremap("ü", "<C-w>h")
nnoremap("ä", "<C-w>j")
nnoremap("ß", "<C-w>k")

-- Split panes in light speed too, by prepending Ctrl to above commands
nnoremap("<C-+>", "<cmd>:vs<CR><C-w>l<cmd>lua require('telescope.builtin').find_files()<CR>")
nnoremap("<C-ä>", "<cmd>:sp<CR><C-w>j<cmd>lua require('telescope.builtin').find_files()<CR>")
nnoremap("<C-ü>", "<cmd>:vs<CR><cmd>lua require('telescope.builtin').find_files()<CR>")
nnoremap("<C-ß>", "<cmd>:sp<CR><cmd>lua require('telescope.builtin').find_files()<CR>")

-- Open LazyGit
nnoremap("<leader>g", "<cmd>LazyGit<CR>")

-- Formatting
nnoremap("ö", "<cmd>lua vim.lsp.buf.format()<CR>")
-- nnoremap("ö", "<cmd>Format<CR>")
-- nnoremap("<leader>f", "gg=G<C-o>")

-- Substitute keybind
nnoremap("<leader>r", ":%s//g<left><left>")

-- Code Actions Menu
nnoremap("<C-Enter>", "<cmd>CodeActionMenu<CR>")

-- Unload all buffers
nnoremap("<C-Esc>", "<cmd>bufdo bwipeout<CR>")

-- Spectre (Search and Replace)
nnoremap("<leader>s", "<cmd>lua require('spectre').open()<CR>")
nnoremap("<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>")
nnoremap("<leader>sf", "<cmd>lua require('spectre').open_file_search()<CR>")

nnoremap("<leader>k", "<cmd>lua require('lsp_signature').toggle_float_win()<CR>")

nnoremap("<leader>at", "<cmd>lua require('ng').goto_template_for_component")
nnoremap("<leader>ac", "<cmd>lua require('ng').goto_component_with_template_file")
nnoremap("<leader>aT", "<cmd>lua require('ng').get_template_tcb")

-- Custom colorscheme toggle for working in the sun
nnoremap("<leader>tt", "<cmd>lua ToggleTheme()<cr>")

-- High-speed logging
nnoremap("<leader>l", "<cmd>lua require('logsitter').log()<cr>")

-- Fix backward leap motion
nmap("S", "<Plug>(leap-backward)")

-- Toggle Trouble Diagnostic List
nnoremap("<leader>t", "<cmd>TroubleToggle<cr>")

-- LSP
nnoremap("gf", "<cmd>Lspsaga finder<cr>")
nnoremap("gd", "<cmd>Lspsaga peek_definition<cr>")
nnoremap("H", "<cmd>Lspsaga hover_doc<cr>")
nnoremap("K", "<cmd>Lspsaga signature_help<cr>")

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    -- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<space>d", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<C-0>", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<space>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})
