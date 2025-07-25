local function clear_cmdarea()
  vim.defer_fn(function()
    vim.api.nvim_echo({}, false, {})
  end, 1000)
end

vim.api.nvim_create_autocmd({ 'InsertLeave', 'TextChanged' }, {
  callback = function()
    if vim.bo.buftype == '' and #vim.api.nvim_buf_get_name(0) ~= 0 and vim.bo.buflisted then
      vim.cmd 'silent w'

      local time = os.date '%I:%M %p'

      -- print nice colored msg
      vim.api.nvim_echo({ { '󰄳', 'LazyProgressDone' }, { ' file autosaved at ' .. time } }, false, {})

      clear_cmdarea()
    end
  end,
})
