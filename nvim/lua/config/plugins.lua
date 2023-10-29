local config = require("user.config")
return {
  ----------------------------------------
  -- Themes
  ----------------------------------------
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("config.colorscheme")
    end,
  },
  -- {
  --   "nyoom-engineering/oxocarbon.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("config.colorscheme")
  --   end,
  -- },

  ----------------------------------------
  -- User Interface
  ----------------------------------------
  { "nvim-lua/plenary.nvim" }, -- Required by telescope
  {
    "nvim-tree/nvim-web-devicons",
    lazy = false,
    config = true,
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "cljoly/telescope-repo.nvim" },
    },
    config = function()
      require("plugins.ui.telescope")
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = {
      "NvimTreeToggle",
      "NvimTreeOpen",
    },
    config = function()
      require("plugins.ui.tree")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "BufEnter",
    config = function()
      require("plugins.ui.lualine")
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.which-key")
    end,
  },
  {
    "andreadev-it/shade.nvim",
    event = "BufWinEnter",
    config = function()
      require("plugins.ui.shade")
    end,
  },
  {
    "stevearc/dressing.nvim", -- Improved UIs
    event = "VeryLazy",
    dependencies = "MunifTanjim/nui.nvim",
    config = function()
      require("plugins.ui.dressing")
    end,
  },

  ----------------------------------------
  -- Productivity
  ----------------------------------------
  {
    "numToStr/Comment.nvim", -- Toggle Comments
    event = "BufEnter *.*",
    branch = "jsx",
    config = function()
      require("plugins.lsp.comment")
    end,
  },
  {
    "RRethy/vim-illuminate", -- Highlight current word/method/var
    event = "InsertEnter",
    config = function()
      require("plugins.lsp.illuminate")
    end,
  },
  {
    "nvim-pack/nvim-spectre",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  }, -- Find and replace
  {
    "kylechui/nvim-surround", -- Quickly change surrounding brackets, quotes, tags, whatever
    keys = { "c" },
    config = true,
  },
  {
    "gaelph/logsitter.nvim",
    event = "BufEnter *.*",
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufWinEnter *.*",
    config = function()
      require("plugins.lastplace")
    end,
  },
  {
    "ggandor/leap.nvim",
    keys = { "s", "S", "g" },
    dependencies = "tpope/vim-repeat",
    config = function()
      require("plugins.leap")
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    event = "VimEnter",
    config = function()
      require("plugins.project")
    end,
  },

  ----------------------------------------
  -- Syntax
  ----------------------------------------
  {
    "windwp/nvim-autopairs", -- Auto-match brackets and quotes
    event = "InsertEnter *.*",
    config = function()
      require("plugins.cmp.autopairs")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead *.*",
    config = function()
      require("plugins.lsp.treesitter")
    end,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "tree-sitter/tree-sitter-embedded-template",
      { "elgiano/nvim-treesitter-angular", branch = "topic/jsx-fix" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufWinEnter *.*",
    config = function()
      require("plugins.lsp.treesitter-context")
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufEnter *.*",
    config = function()
      require("plugins.colorizer")
    end,
  },
  {
    "rcarriga/nvim-notify",
    event = "VimEnter",
    config = function()
      require("plugins.ui.notify")
    end,
  },

  ----------------------------------------
  -- LSP Base
  ----------------------------------------
  {
    "neovim/nvim-lspconfig",
    event = "BufRead *.*",
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    servers = nil,
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
  },

  ----------------------------------------
  -- LSP - Formatters
  ----------------------------------------
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufRead *.*",
    dependencies = { "mason.nvim" },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("plugins.lsp.null-ls")
    end,
  },

  ----------------------------------------
  -- LSP - Autocomplete
  ----------------------------------------
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter *.*",
    config = function()
      require("plugins.cmp")
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-calc",
      "saadparwaiz1/cmp_luasnip",
      { "L3MON4D3/LuaSnip", dependencies = "rafamadriz/friendly-snippets" },
      {
        "David-Kunz/cmp-npm",
        config = function()
          require("plugins.cmp.cmp-npm")
        end,
      },
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
  },

  ----------------------------------------
  -- LSP - Addons
  ----------------------------------------
  {
    "nvim-lua/popup.nvim",
  },
  {
    "jose-elias-alvarez/typescript.nvim",
  },
  {
    "axelvc/template-string.nvim",
    event = "InsertEnter *.{svelte,ts,tsx,js,jsx}",
    ft = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
    },
    config = true, -- run require("template-string").setup()
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    event = "BufWinEnter *.*",
    cond = config.plugins.inlayhints,
    config = function()
      require("plugins.lsp.inlay-hints")
    end,
  },
  {
    "zbirenbaum/copilot.lua", -- GitHub Copilot
    event = "InsertEnter",
    config = function()
      require("plugins.cmp.copilot")
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "BufEnter *.*",
    config = true,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.lsp.lsp_signature")
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("plugins.lsp.lspsaga")
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  ----------------------------------------
  -- Git
  ----------------------------------------
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead *.*",
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

  ----------------------------------------
  -- JavaScript/TypeScript
  ----------------------------------------
  {
    "vuki656/package-info.nvim",
    event = "BufEnter package.json",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("plugins.lsp.package-info")
    end,
  },
  {
    "dmmulroy/tsc.nvim",
    cmd = "TSC",
    config = true, -- run require("tsc").setup()
  },

  ----------------------------------------
  -- Misc
  ----------------------------------------
  {
    "Pocco81/auto-save.nvim",
    cond = config.plugins.auto_save.enabled,
    event = config.plugins.auto_save.events,
    config = function()
      require("plugins.auto-save")
    end,
  },
  {
    "rgroli/other.nvim",
    event = "BufWinEnter *.{html,css,scss,ts}",
    config = function()
      require("plugins.lsp.other")
    end,
  },
  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
  },
  {
    "code-biscuits/nvim-biscuits",
    event = "BufRead *.*",
    config = function()
      require("plugins.lsp.biscuits")
    end,
  },
  {
    "chrisgrieser/nvim-early-retirement",
    event = "VeryLazy",
    config = function()
      require("plugins.early-retirement")
    end,
  },

  ----------------------------------------
  -- Language Support
  ----------------------------------------
  {
    "dag/vim-fish",
    ft = "fish",
    event = "BufEnter *.fish",
  },
  {
    "amadeus/vim-mjml",
    ft = "mjml",
  },
  {
    "vim-ruby/vim-ruby",
    ft = { "ruby", "eruby" },
  },
  {
    "tpope/vim-rails",
    ft = { "ruby", "eruby" },
  },
  {
    "tpope/vim-endwise",
    ft = { "ruby", "eruby" },
  },

  -- use("vim-ruby/vim-ruby")
  --   use("tpope/vim-rails")
  --   use("tpope/vim-endwise")
  --   use("tpope/vim-bundler")
}
