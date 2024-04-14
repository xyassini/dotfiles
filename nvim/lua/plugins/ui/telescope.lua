local telescope = require("telescope")

telescope.setup({
  defaults = {
    preview = {
      -- truncate the file preview to 100 KB
      filesize_hook = function(filepath, bufnr, opts)
        local max_bytes = 100000 -- 100 KB threshold
        local cmd = { "head", "-c", max_bytes, filepath }
        require('telescope.previewers.utils').job_maker(cmd, bufnr, opts)
      end
    }
  }
})

-- telescope.load_extension("fzf")
