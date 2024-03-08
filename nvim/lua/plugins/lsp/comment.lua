require('Comment').setup({
    padding = true,
    sticky = true,
    ignore = nil,
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        ---Line-comment toggle keymap
        line = 'tc',
        ---Block-comment toggle keymap
        block = 'tb',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
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
    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
    },
    ---Function to call before (un)comment
    pre_hook = nil,
    ---Function to call after (un)comment
    post_hook = nil,
})

