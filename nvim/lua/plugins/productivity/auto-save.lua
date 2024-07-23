return {
  "pocco81/auto-save.nvim",
  event = "InsertEnter",
  opts = {
    enabled = true,
    trigger_events = { "InsertLeave" },
    debounce_delay = 2000
  }
}
