local status, tree = pcall(require, "nvim-tree")
if not status then
  print("Error: nvim-tree not installed")
  return
end

tree.setup({})

