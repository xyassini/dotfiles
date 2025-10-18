return {
  'yioneko/nvim-vtsls',
  keys = {
    {
      '<leader>t',
      desc = 'Typescript',
    },
    {
      '<leader>ti',
      function()
        require('vtsls').commands.add_missing_imports()
      end,
      desc = 'Add missing imports',
    },
    {
      '<leader>tf',
      function()
        require('vtsls').commands.fix_all()
      end,
      desc = 'Fix all issues',
    },
    {
      '<leader>to',
      function()
        require('vtsls').commands.organize_imports()
      end,
      desc = 'Organize imports',
    },
    {
      '<leader>tt',
      function()
        require('vtsls').commands.add_missing_imports()
        require('vtsls').commands.organize_imports()
        require('vtsls').commands.fix_all()
      end,
      desc = 'Add missing imports, organize imports and fix all issues',
    },
  },
}
