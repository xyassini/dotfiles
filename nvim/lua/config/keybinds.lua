local wk_status, which_key = pcall(require, "which-key")
if not wk_status then
  return
end

which_key.add({
  -- Pane switching
  {
    "+",
    function()
      vim.cmd("wincmd l")
    end,
    desc = "Go to right pane"
  },
  {
    "ü",
    function()
      vim.cmd("wincmd h")
    end,
    desc = "Go to left pane"
  },
  {
    "ä",
    function()
      vim.cmd("wincmd j")
    end,
    desc = "Go to below pane"
  },
  {
    "ß",
    function()
      vim.cmd("wincmd k")
    end,
    desc = "Go to above pane"
  },

  -- Pane splitting
  {
    "<C-+>",
    function()
      vim.cmd.vs()
      vim.cmd("wincmd l")
      require('fzf-lua').files()
    end,
    desc = "Split pane right and open file picker",
  },
  {
    "<C-ü>",
    function()
      vim.cmd.vs()
      require('fzf-lua').files()
    end,
    desc = "Split pane left and open file picker",
  },
  {
    "<C-ä>",
    function()
      vim.cmd.sp()
      vim.cmd("wincmd j")
      require('fzf-lua').files()
    end,
    desc = "Split pane below and open file picker",
  },
  {
    "<C-ß>",
    function()
      vim.cmd.sp()
      require('fzf-lua').files()
    end,
    desc = "Split pane above and open file picker",
  },

  -- Pickers
  {
    "<C-p>",
    function()
      require('fzf-lua').files({ resume = false })
    end,
    desc = "Open file picker",
  },

  {
    "<C-S-p>",
    function()
      require('fzf-lua').files({ resume = true })
    end,
    desc = "Open file picker",
  },

  {
    "<C-f>",
    function()
      require('fzf-lua').live_grep_native({ resume = false })
    end,
    desc = "Open search in files",
  },

  {
    "<C-S-f>",
    function()
      require('fzf-lua').live_grep_native({ resume = true })
    end,
    desc = "Open search in files",
  },

  {
    "<leader>p",
    function()
      require("fzf-lua").global()
    end,
    desc = "Open global picker"
  },

  {
    "<leader>e",
    function()
      vim.cmd("Neotree toggle")
    end,
    desc = "Toggle neotree"
  },

  -- LSP
  {
    "ö",
    function()
      require("conform").format({ lsp_fallback = true })
    end,
    desc = "Format Code"
  },

  {
    "gd",
    function()
      vim.lsp.buf.definition()
    end,
    desc = "Go to definition"
  },

  {
    "gr",
    function()
      vim.lsp.buf.references()
    end,
    desc = "Go to references"
  },

  {
    "rn",
    function()
      vim.lsp.buf.rename()
    end,
    desc = "Rename symbol under cursor"
  },

  {
    "<C-Enter>",
    function()
      require("fzf-lua").lsp_code_actions()
    end,
    desc = "Open code actions"

  }


})
