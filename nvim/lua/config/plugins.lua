return {
  "nvim-lua/plenary.nvim",

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("plugins.ui.tokyonight")
    end
  },

  ----------------------
  -- User Interface
  ----------------------
  {
    "nvim-tree/nvim-tree.lua",
    cmd = {
      "NvimTreeToggle",
      "NvimTreeOpen",
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("plugins.ui.nvim-tree")
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "BurntSushi/ripgrep",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("plugins.ui.telescope")
    end
  },

  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("plugins.ui.lualine")
    end
  },

  ----------------------
  -- Syntax
  ----------------------
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "tree-sitter/tree-sitter-embedded-template",
      { "elgiano/nvim-treesitter-angular", branch = "topic/jsx-fix" },
    },
    config = function()
      require("plugins.treesitter")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufEnter" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("plugins.treesitter.context")
    end,
  },

  ----------------------
  -- Language Server
  ----------------------
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    config = function()
      require("plugins.lsp.mason")
    end
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("plugins.lsp.mason-lspconfig")
    end
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("plugins.lsp")
    end
  },

  {
    "stevearc/conform.nvim",
    config = function()
      require("plugins.lsp.conform")
    end
  },

  {
    "numToStr/Comment.nvim",
    keys = { "tc", "tb", "cA", "co", "cO" },
    config = function()
      require("plugins.lsp.comment")
    end
  },

  ----------------------
  -- Autocomplete
  ----------------------

  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy"
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require("plugins.cmp")
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp"
      },
      {
        "zbirenbaum/copilot-cmp",
        config = true,
      },
    },
  },

  {
    "zbirenbaum/copilot.lua", -- GitHub Copilot
    event = "InsertEnter",
    config = function()
      require("plugins.cmp.copilot")
    end,
  },


  ----------------------
  -- Git
  ----------------------
  {
    "lewis6991/gitsigns.nvim",
    event = "BufWinEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.git.gitsigns")
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitCurrentFile",
      "LazyGitFilterCurrentFile",
      "LazyGitFilter",
    },
    config = function()
      vim.g.lazygit_floating_window_scaling_factor = 1
    end,
  },

  {
    "f-person/git-blame.nvim",
    event = "BufWinEnter"
  },


  ----------------------
  -- Convenience
  ----------------------

  {
    "Pocco81/auto-save.nvim",
    event = "InsertLeave",
    config = function()
      require("plugins.auto-save")
    end,
  },
}
