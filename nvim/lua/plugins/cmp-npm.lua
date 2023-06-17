local status, cmp_npm = pcall(require, "cmp-npm")
if (not status) then
  return
end

cmp_npm.setup({
  ignore = {},
  only_semantic_versions = true,
})
