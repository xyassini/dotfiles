return {
  plugins = {
    -- Configure, enable or disable plugins here
    inlayhints = true,
    auto_save = {
      -- Automatically saves buffer on certain events (default "InsertLeave")
      enabled = true,
      events = { "InsertLeave" },
    },
  },
}
