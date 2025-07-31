-- Show diagnostic messages in a floating window when the cursor is held over a line with diagnostics.
local diagnostic_float_win = nil

vim.api.nvim_create_autocmd({ 'CursorHold' }, {
  group = vim.api.nvim_create_augroup('float_diagnostic', { clear = true }),
  callback = function()
    -- Close previous float if it exists
    if diagnostic_float_win and vim.api.nvim_win_is_valid(diagnostic_float_win) then
      pcall(vim.api.nvim_win_close, diagnostic_float_win, false)
    end

    -- Open new float and store the window handle
    local _, win_id = vim.diagnostic.open_float(nil, { focus = false })
    diagnostic_float_win = win_id
  end,
})

vim.api.nvim_create_autocmd({ 'WinLeave', 'InsertEnter' }, {
  group = vim.api.nvim_create_augroup('close_diagnostic_float', { clear = true }),
  callback = function()
    if diagnostic_float_win and vim.api.nvim_win_is_valid(diagnostic_float_win) then
      pcall(vim.api.nvim_win_close, diagnostic_float_win, false)
      diagnostic_float_win = nil
    end
  end,
})

vim.api.nvim_create_autocmd({ 'DiagnosticChanged' }, {
  callback = function()
    if diagnostic_float_win and vim.api.nvim_win_is_valid(diagnostic_float_win) then
      pcall(vim.api.nvim_win_close, diagnostic_float_win, false)
    end
  end,
})
