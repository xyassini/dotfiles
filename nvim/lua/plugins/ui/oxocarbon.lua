if vim.fn.has('macunix') == 1 then
  local handle = io.popen("defaults read -g AppleInterfaceStyle")
  local result = handle:read("*a")
  handle:close()

  if string.match(result, "^Dark") then
    vim.opt.background = "dark"
  else
    vim.opt.background = "light"
  end
end

vim.cmd("colorscheme oxocarbon")
