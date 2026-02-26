return {
  "saghen/blink.cmp",
  version = "1.*",
  opts = {
    keymap = {
      preset = "none",  -- disable ALL default keymaps

      -- manual trigger (optional, but nice)
      ["<C-n>"]   = { "show" },

      -- navigation
      ["<Tab>"]   = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },

      -- accept completion (classic Vim)
      ["<C-y>"]   = { "accept" },

      -- ❌ no <CR>, ❌ no <Esc>
    },

    completion = {
      menu = {
        auto_show = true,   -- popup while typing
        min_length = 2,     -- optional: reduce noise
      },
    },
  },
}
