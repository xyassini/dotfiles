require("toggleterm").setup({
  open_mapping = [[<C-->]],
})

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-,>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-ß>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-ä>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-.>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
