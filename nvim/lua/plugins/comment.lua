return {
  'numToStr/Comment.nvim',
  keys = {
    "tc",
    "tb",
    "cO",
    "co",
    "cA"
  },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring"
  },
  config = function()
    ---@diagnostic disable-next-line: missing-fields
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
        above = 'cO',
        ---Add comment on the line below
        below = 'co',
        ---Add comment at the end of line
        eol = 'cA',
      },
    })
  end
}
