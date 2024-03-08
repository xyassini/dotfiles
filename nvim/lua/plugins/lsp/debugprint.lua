require("debugprint").setup({
  create_keymaps = false,
  create_commands = false,
})

vim.keymap.set("n", "<Leader>l", function()
    return require('debugprint').debugprint({ variable = true })
end, {
    expr = true,
})
vim.keymap.set("n", "<Leader>L", function()
    return require('debugprint').debugprint({ above = true, variable = true })
end, {
    expr = true,
})

vim.keymap.set("n", "<Leader>dl", function()
    require('debugprint').deleteprints()
end)
