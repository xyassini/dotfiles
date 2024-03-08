local js = {
  left = "console.warn(\"",
  right = "\")",
  mid_var = "\", ",
  right_var = ")"
}


require("debugprint").setup({
  create_keymaps = false,
  create_commands = false,
  filetypes = {
    [ "svelte" ] = js,
    [ "astro" ] = js
  }
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
