return {
  "RRethy/vim-illuminate",
  event = { "LspAttach", "InsertEnter" },
  config = function()
    require("illuminate").configure({
      delay = 100,
      under_cursor = true
    })
  end
}
