vim.api.nvim_create_autocmd('UIEnter', {
  callback = function()
    require('auto-session').auto_restore_session_at_vim_enter()
  end,
})
