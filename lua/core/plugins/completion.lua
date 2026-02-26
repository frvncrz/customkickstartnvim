return {
  "saghen/blink.cmp",
  version = "1.*",
  opts = {
    keymap = {
      preset = "none",

      ["<C-n>"]   = { "show" },
      ["<Tab>"]   = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<C-y>"]   = { "accept" },
    },

    completion = {
      menu = {
        auto_show = true,
      },
    },
  },
}
