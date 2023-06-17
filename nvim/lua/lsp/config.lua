vim.diagnostic.config({
  float = {
    source = false,
    format = function(diagnostic)
      local code = diagnostic.user_data.lsp.code

      if not diagnostic.source or not code then
        return string.format('%s', diagnostic.message)
      end

      return string.format('%s [%s]', diagnostic.message, diagnostic.source)
    end
  },
  severity_sort = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  virtual_text = {
    prefix = "  ",
  },
})
