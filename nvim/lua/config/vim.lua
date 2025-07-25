vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.api.nvim_set_option('clipboard', 'unnamed')

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- Show which line your cursor is on
vim.o.cursorline = true

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Save undo history
vim.o.undofile = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'
