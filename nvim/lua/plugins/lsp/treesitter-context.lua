local status, treesitter_context = pcall(require, "treesitter-context")
if (not status) then
  return
end

treesitter_context.setup({
  enable = true,
  patterns = {
    default = {
      'class',
      'function',
      'method',
      'for',
      'while',
      'if',
      'switch',
      'case',
    },
    markdown = {
      'section',
    },
    json = {
      'pair',
    },
    yaml = {
      'block_mapping_pair',
    },
  }
})

