return {
  {
    "goolord/alpha-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local alpha = require("alpha")

      --------------------------------------------------
      -- Skull ASCII
      --------------------------------------------------
      local logo = [[
    .o oOOOOOOOo                                            0OOOo
    Ob.OOOOOOOo  OOOo.      oOOo.                      .adOOOOOOO
    OboO000000000000.OOo. .oOOOOOo.    OOOo.oOOOOOo..0000000000OO
    OOP.oOOOOOOOOOOO 0POOOOOOOOOOOo.   `0OOOOOOOOOP,OOOOOOOOOOOB'
    `O'OOOO'     `OOOOo"OOOOOOOOOOO` .adOOOOOOOOO"oOOO'    `OOOOo
    .OOOO'            `OOOOOOOOOOOOOOOOOOOOOOOOOO'            `OO
    OOOOO                 '"OOOOOOOOOOOOOOOO"`                oOO
   oOOOOOba.                .adOOOOOOOOOOba               .adOOOOo.
  oOOOOOOOOOOOOOba.    .adOOOOOOOOOO@^OOOOOOOba.     .adOOOOOOOOOOOO
 OOOOOOOOOOOOOOOOO.OOOOOOOOOOOOOO"`  '"OOOOOOOOOOOOO.OOOOOOOOOOOOOO
 0OOOO0       OOOoOOOOOOOOOOOOOO`  .   '"OOOOOOOOOOOOoOO"     0OOO0
    Y           'OOOOOOOOOOOOOO: .oOOo. :OOOOOOOOOOO?'         :`
    :         .oO%OOOOOOOOOOo.OOOOOO.oOOOOOOOOOOOO?         .
    .oOOP"%OOOOOOOOoOOOOOOO?oOOOOO?OOOO"OOo
      '%o  OOOO"%OOOO%"%OOOOO"OOOOOO"OOO':
             `$"  `OOOO' `O"Y ' `OOOO'  o
      ]]

      local skull_lines = vim.split(logo, "\n")

      --------------------------------------------------
      -- Gradient
      --------------------------------------------------
      local gradient = {
        "#FF9A12",
        "#F08810",
        "#E0760E",
        "#C85B0B",
        "#B04008",
        "#901C04",
        "#7A0601",
      }

      for i, color in ipairs(gradient) do
        vim.api.nvim_set_hl(0, "SkullAscii" .. i, {
          fg = color,
          bold = true,
        })
      end

      local header = {}

      local function get_gradient_index(i, total_lines)
  local percent = (i - 1) / (total_lines - 1)
  return math.floor(percent * (#gradient - 1)) + 1
end

      local total = #skull_lines

for i, line in ipairs(skull_lines) do
  local idx = get_gradient_index(i, total)

  table.insert(header, {
    type = "text",
    val = line,
    opts = {
      position = "center",
      hl = "SkullAscii" .. idx,
    },
  })
  end
      --------------------------------------------------
      -- Buttons
      --------------------------------------------------
     local dashboard = require("alpha.themes.dashboard")

     dashboard.section.buttons.val = {
     dashboard.button("f", "🔍  Find Files", ":Telescope find_files<CR>"),
     dashboard.button("r", "📁  Recent Files", ":Telescope oldfiles<CR>"),
     dashboard.button("e", "🌴  Neo-tree", ":Neotree toggle<CR>"),
     dashboard.button("l", "💤  Lazy", ":Lazy<CR>"),
}
      --------------------------------------------------
      -- Footer
      --------------------------------------------------
      vim.api.nvim_set_hl(0, "SkullFooterGlow", {
        fg = "#FF9A12",
        bold = true,
      })

      local footer = {
        type = "text",
        val = "⚡️ HAPPY HACKING BOYS! ⚡️",
        opts = {
          position = "center",
          hl = "SkullFooterGlow",
        },
      }

      --------------------------------------------------
      -- Layout
      --------------------------------------------------
      local layout = {
        { type = "padding", val = 8 },
      }

      for _, line in ipairs(header) do
        table.insert(layout, line)
      end

      table.insert(layout, { type = "padding", val = 2 })

      table.insert(layout, { type = "padding", val = 2 })
      table.insert(layout, dashboard.section.buttons)

      table.insert(layout, { type = "padding", val = 2 })
      table.insert(layout, footer)

      alpha.setup({
        layout = layout,
      })
      if vim.fn.argc() == 0 then
  vim.cmd("Alpha")
end
    end,
  },
}
