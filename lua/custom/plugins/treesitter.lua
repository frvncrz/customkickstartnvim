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
}
