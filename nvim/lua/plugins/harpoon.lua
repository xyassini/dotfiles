return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  opts = {},
  keys = {
    {
      '<leader>a',
      function()
        require('harpoon'):list():add()
      end,
      desc = 'Add file to Harpoon',
    },
    {
      '<leader>m',
      function()
        local harpoon = require 'harpoon'
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
    },
    {
      '<leader>1',
      function()
        require('harpoon'):list():select(1)
      end,
    },
    {
      '<leader>2',
      function()
        require('harpoon'):list():select(2)
      end,
    },
    {
      '<leader>3',
      function()
        require('harpoon'):list():select(3)
      end,
    },
    {
      '<leader>4',
      function()
        require('harpoon'):list():select(4)
      end,
    },
    {
      '<leader>+',
      function()
        require('harpoon'):list():next()
      end,
    },
    {
      '<leader>ü',
      function()
        require('harpoon'):list():prev()
      end,
    },
  },
  dependencies = { 'nvim-lua/plenary.nvim' },
}
