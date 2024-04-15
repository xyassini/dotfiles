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
    "folke/neodev.nvim",
    ft = { "lua", "vim" },
    config = true,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require("plugins.ui.neo-tree")
    end
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
  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    config = function()
      require("plugins.ui.window-picker")
    end,
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
      "tree-sitter/tree-sitter-embedded-template",
      "windwp/nvim-ts-autotag",
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

  {
    "RRethy/vim-illuminate", -- Highlight current word/method/var
    event = "BufWinEnter",
    version = "*",
    config = function()
      require("plugins.lsp.illuminate")
    end,
  },

  {
    "kylechui/nvim-surround", -- Quickly change surrounding brackets, quotes, tags, whatever
    keys = { "cs", "ds" },
    config = true
  },

  {
    "andrewferrier/debugprint.nvim",
    keys = { "<Leader>l", "<Leader>L", "<Leader>dl" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    },
    version = "*",
    config = function()
      require("plugins.lsp.debugprint")
    end,
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

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },

  {
    "axelvc/template-string.nvim",
    ft = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "astro",
    },
    config = true,
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
  -- Navigation
  ----------------------

  {
    "rgroli/other.nvim",
    event = "BufWinEnter *.{html,css,scss,ts}",
    config = function()
      require("plugins.lsp.other")
    end,
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

  {
    "chrisgrieser/nvim-early-retirement",
    event = "VeryLazy",
    config = true
  },
}
