return {
  'nvimdev/dashboard-nvim',
  enable = false,
  event = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- 1️⃣ Raw ASCII (string only)
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
                      `$"  `OOOO' `O"Y ' `OOOO'  o             .
    .                  .     OP"          : o     .
                              :
  ]]

    -- 2️⃣ Split into lines
    local skull_lines = vim.split(logo, '\n', { trimempty = true })

    -- 3️⃣ Gradient colors
    local skull_gradient = {
      '#FF9A12',
      '#F89111',
      '#F08810',
      '#E87F0F',
      '#E0760E',
      '#D86D0D',
      '#D0640C',
      '#C85B0B',
      '#C0520A',
      '#B84909',
      '#B04008',
      '#A83707',
      '#A02E06',
      '#982505',
      '#901C04',
      '#881303',
      '#800A02',
      '#7A0601',
    }

    -- 4️⃣ Define highlight groups
    for i, color in ipairs(skull_gradient) do
      vim.api.nvim_set_hl(0, 'SkullAscii' .. i, {
        fg = color,
        bold = true,
      })
    end

    -- 5️⃣ Build dashboard header (text + highlight)
    ---@type { [1]: string, [2]: string }[]
    local skull_header = {}

    for i, line in ipairs(skull_lines) do
      table.insert(skull_header, {
        line,
        'SkullAscii' .. math.min(i, #skull_gradient),
      })
    end

    -- 6️⃣ Dashboard setup
    require('dashboard').setup {
      theme = 'doom',
      config = {
        header = vim.split(logo, '\n', { trimempty = true }),
        week_header = {
          enable = false,
        },

        center = {
          {
            icon = '🔍 ',
            desc = 'Find Files',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            icon = '📁 ',
            desc = 'Recent Files',
            action = 'Telescope oldfiles',
            key = 'r',
          },
          {
            icon = '🌴 ',
            desc = 'Neo-tree',
            action = 'Neotree toggle',
            key = 'e',
          },
          {
            icon = '💤 ',
            desc = 'Lazy',
            action = 'Lazy',
            key = 'l',
          },
        },

        footer = {
          '',
          '⚡️ HAPPY HACKING BOYS! 💻🎧 ⚡️',
        },
      },
    }
  end,
}
