local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
  "n",
  "<C-Enter>",
  function()
    vim.cmd.RustLsp('codeAction')
  end,
  { silent = true, buffer = bufnr, desc = "Show code actions" }
)
