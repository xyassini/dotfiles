local wk_status, which_key = pcall(require, 'which-key')
if not wk_status then
  return
end

which_key.add({
  {
    mode = { "n" },

    -- Pane switching
    { "+",         "<C-w>l",                                                    desc = "Go to right pane" },
    { "ü",         "<C-w>h",                                                    desc = "Go to left pane" },
    { "ä",         "<C-w>j",                                                    desc = "Go to below pane" },
    { "ß",         "<C-w>k",                                                    desc = "Go to above pane" },

    -- Pane splitting
    { "<C-+>",     "<cmd>:vs<CR><C-w>l<cmd>Telescope find_files<CR>",           desc = "Split pane right and open file picker" },
    { "<C-ü>",     "<cmd>:vs<CR><C-w>h<cmd>Telescope find_files<CR>",           desc = "Split pane left and open file picker" },
    { "<C-ä>",     "<cmd>:sp<CR><C-w>j<cmd>Telescope find_files<CR>",           desc = "Split pane below and open file picker" },
    { "<C-ß>",     "<cmd>:sp<CR><C-w>k<cmd>Telescope find_files<CR>",           desc = "Split pane above and open file picker" },

    -- Navigation
    { "<C-p>",     "<cmd>Telescope find_files<CR>",                             desc = "Open file picker" },
    { "<C-f>",     "<cmd>Telescope live_grep<CR>",                              desc = "Search in all files" },
    { "<C-b>",     "<cmd>Telescope buffers<CR>",                                desc = "Open buffer file picker" },
    { "<C-g>",     "<cmd>Telescope git_status<CR>",                             desc = "Open staged file picker" },
    { "<leader>e", "<cmd>Neotree toggle<CR>",                                   desc = "Toggle Neotree" },

    -- Other.nvim
    { "<leader>o", "<cmd>Other<CR>",                                            desc = "Open related file" },

    -- Text manipulation
    { "<leader>r", ":%s//g<left><left>",                                        desc = "Regex search and replace in file" },


    -- Productivity
    { "<leader>?", function() require("which-key").show({ global = true }) end, desc = "Show keymaps" },
    { "<leader>d", "<cmd>Neogen<CR>",                                           desc = "Generate annotation" },
    { "<leader>g", "<cmd>LazyGit<CR>",                                          desc = "Open Lazygit" },

    -- Flash.nvim / Search label navigation
    { "s",         function() require("flash").jump() end,                      desc = "Flash",                                mode = { "n", "x", "o" } },
    { "S",         function() require("flash").treesitter() end,                desc = "Flash Treesitter",                     mode = { "n", "x", "o" } },
    { "r",         function() require("flash").remote() end,                    desc = "Remote Flash",                         mode = "o" },
    { "R",         function() require("flash").treesitter_search() end,         desc = "Treesitter Search",                    mode = { "o", "x" } },
    { "<c-s>",     function() require("flash").toggle() end,                    desc = "Toggle Flash Search",                  mode = { "c" } },


    -- Testing
    {
      "ta",
      function()
        require("neotest").run.run()
      end,
      desc = "Run all tests",
      group = "Neotest"
    },
    {
      "tf",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Run tests in current file",
      group = "Neotest"
    },
    {
      "tS",
      function()
        require("neotest").run.stop()
      end,
      desc = "Stop running tests",
      group = "Neotest"
    },
    {
      "tw",
      function()
        require("neotest").watch.toggle()
      end,
      desc = "Toggle test watch mode",
      group = "Neotest"
    },
    {
      "ts",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Toggle test summary",
      group = "Neotest"
    },



    -- LSP
    { "<leader>i", "<cmd>TSToolsAddMissingImports<CR>", desc = "Add missing imports" },
    {
      "ö",
      function()
        require("conform").format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 5000
        })
      end,
      desc = "Format current buffer"
    },

    {
      "gD",
      function()
        vim.lsp.buf.declaration()
      end,
      desc = "Go to declaration"
    },
    {
      "gd",
      function()
        vim.lsp.buf.definition()
      end,
      desc = "Go to definition"
    },
    {
      "K",
      function()
        vim.lsp.buf.hover()
      end,
      desc = "Show documentation for symbol under cursor"
    },
    {
      "gi",
      function()
        vim.lsp.buf.implementation()
      end,
      desc = "Go to implementation"
    },
    {
      "<C-k>",
      function()
        vim.lsp.buf.signature_help()
      end,
      desc = "Show signature help"
    },
    {
      "<leader>D",
      function()
        vim.lsp.buf.type_definition()
      end,
      desc = "Go to type definition"
    },
    {
      "<leader>n",
      function()
        vim.lsp.buf.rename()
      end,
      desc = "Rename symbol under cursor"
    },
    {
      "<C-Enter>",
      function()
        vim.lsp.buf.code_action()
      end,
      desc = "Show code actions",
      mode = { "n", "v" }
    },
    {
      "gr",
      function()
        vim.lsp.buf.references()
      end,
      desc = "Show references to symbol under cursor"
    }

  }
})

--[[
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<C-Enter>', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
--]]
