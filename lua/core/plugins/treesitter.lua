return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,          -- 👈 ADD THIS
    priority = 1000,       -- 👈 ADD THIS
    config = function()
      require("nvim-treesitter.config").setup({
        ensure_installed = { "lua", "vim", "bash", "json" },
        highlight = {
          enable = true,
        },
      })
    end,
  },

  {
  "nvim-treesitter/nvim-treesitter-context",
  opts = {
    enable = true,
    mode = "cursor",
    separator = nil,
    max_lines = 0,
    min_window_height = 0,
    line_numbers = true,

    -- 🔑 This removes the gray background blocks
    on_attach = function()
      vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "none" })
      vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { bg = "none" })
    end,
  },
}
}

