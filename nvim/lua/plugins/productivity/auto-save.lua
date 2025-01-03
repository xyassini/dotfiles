return {
  "pocco81/auto-save.nvim",
  event = "InsertEnter",
  opts = {
    enabled = true,
    trigger_events = { "InsertLeave" },
    condition = function()
      vim.schedule(function()
        vim.fn.timer_start(500, function()
          local mode = vim.api.nvim_get_mode().mode
          if mode ~= "i" then
            vim.cmd("write")
          end
        end)
      end)
      return false
    end,
    debounce_delay = 2000,
  },
}
