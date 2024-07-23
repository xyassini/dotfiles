return {
  'numToStr/Comment.nvim',
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring"
  },
  config = function()
    require('Comment').setup({
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      toggler = {
        ---Line-comment toggle keymap
        line = 'tc',
        ---Block-comment toggle keymap
        block = 'tb',
      },
      ---LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        -- -Line-comment keymap
        line = 'tc',
        ---Block-comment keymap
        block = 'tb',
      },
      ---LHS of extra mappings
      extra = {
        ---Add comment on the line above
        above = 'gcO',
        ---Add comment on the line below
        below = 'gco',
        ---Add comment at the end of line
        eol = 'gcA',
      },
    })
  end
}
