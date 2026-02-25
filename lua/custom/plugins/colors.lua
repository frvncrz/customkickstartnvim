return {
  {
    "kxzk/skull-vim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Set colorscheme
      vim.cmd.colorscheme("skull")

      -- Load your UI modules
      require("custom.ui.colors")
      require("custom.ui.icons")
      require("custom.ui.winbar")

      -- 🔥 Skull glow gradient
      local skull_glow = {
        "#FF9A12",
        "#F08810",
        "#E0760E",
        "#C85B0B",
      }

      for i, color in ipairs(skull_glow) do
        vim.api.nvim_set_hl(0, "SkullGlow" .. i, {
          fg = color,
          bold = true,
        })
      end

      -- Shadow
      vim.api.nvim_set_hl(0, "SkullGlowShadow", {
        fg = "#5A2E00",
      })

      -- Dashboard header
      vim.api.nvim_set_hl(0, "DashboardHeader", {
        fg = "#FF9A12",
      })
    end,
  },
}
