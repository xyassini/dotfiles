local nmap = require("utils.remap").nmap
local imap = require("utils.remap").imap

---------------------
-- Navigation
---------------------
-- File Tree
nmap("<leader>e", "<cmd>Neotree<CR>") -- Toggle
--nmap("±", "<cmd>NvimTreeResize +5<CR>") -- Increase width
--nmap("–", "<cmd>NvimTreeResize -5<CR>") -- Decrease width

-- Move through panes in light speed (at least on a German keyboard)
nmap("+", "<C-w>l")
nmap("ü", "<C-w>h")
nmap("ä", "<C-w>j")
nmap("ß", "<C-w>k")

-- Split panes in light speed too, by prepending Ctrl to above commands
nmap("<C-+>", "<cmd>:vs<CR><C-w>l<cmd>Telescope find_files<CR>")
nmap("<C-ä>", "<cmd>:sp<CR><C-w>j<cmd>Telescope find_files<CR>")
nmap("<C-ü>", "<cmd>:vs<CR><cmd>Telescope find_files<CR>")
nmap("<C-ß>", "<cmd>:sp<CR><cmd>Telescope find_files<CR>")

-- Telescope
nmap("<C-p>", "<cmd>Telescope find_files<CR>")
nmap("<C-f>", "<cmd>Telescope live_grep<CR>")
nmap("<C-b>", "<cmd>Telescope buffers<CR>")
nmap("<C-g>", "<cmd>Telescope git_status<CR>")

-- Other.nvim
nmap("<leader>o", "<cmd>Other<CR>")

-- LazyGit
nmap("<leader>g", "<cmd>LazyGit<CR>")


---------------------
-- Language Servers
---------------------
nmap("<C-Enter>", "<cmd>lua vim.lsp.buf.code_action()<CR>")
imap("<C-Enter>", "<cmd>lua vim.lsp.buf.code_action()<CR>")


---------------------
-- Text Manipulation
---------------------
-- Substitute keybind
nmap("<leader>r", ":%s//g<left><left>")

-- Format code
nmap("ö", "<cmd>lua vim.lsp.buf.format()<CR>")

