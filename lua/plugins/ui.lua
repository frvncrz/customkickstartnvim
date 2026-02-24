return {
  {
    'slugbyte/lackluster.nvim',
    priority = 1000,
    config = function()
      require('lackluster').setup {
        disable_plugin = {
          comments = { italic = false },
        },
      }
      -- vim.cmd.colorscheme 'lackluster-night'
      -- vim.cmd.colorscheme 'terse'
      -- vim.cmd.colorscheme 'alqbaster-bg'
      -- vim.cmd.colorscheme 'lightingale'
      -- vim.cmd.colorscheme 'nightingale'
      -- vim.cmd.colorscheme 'JapaneseIndigo'
      vim.cmd.colorscheme 'skull'

      require 'ui.colors'
      require 'ui.icons' -- 👈 icons load here
      require 'ui.winbar'

      -- 🔥 Skull glow gradient (top → bottom warmth)
      local skull_glow = {
        '#FF9A12', -- bright orange
        '#F08810',
        '#E0760E',
        '#C85B0B',
      }

      for i, color in ipairs(skull_glow) do
        vim.api.nvim_set_hl(0, 'SkullGlow' .. i, {
          fg = color,
          bold = true,
        })
      end

      -- Optional: soft shadow / halo (dimmer)
      vim.api.nvim_set_hl(0, 'SkullGlowShadow', {
        fg = '#5A2E00',
      })

      vim.api.nvim_set_hl(0, 'DashboardHeader', {
        fg = '#FF9A12',
      })
      -- vim.cmd.colorscheme 'monrovia'
      -- vim.cmd.colorscheme 'paramount'
      -- vim.cmd.colorscheme 'candle'
      -- vim.cmd.colorscheme 'spacegray'
      -- vim.cmd.colorscheme 'typewriter-night'
      -- vim.cmd.colorscheme 'typewriter'
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      -- Helper: extract fg color from highlight group
      local function hl_fg(name)
        local hl = vim.api.nvim_get_hl(0, { name = name })
        return hl.fg and string.format('#%06x', hl.fg) or nil
      end

      require('lualine').setup {
        options = {
          theme = nil,
          section_separators = '',
          component_separators = '',
        },

        sections = {
          lualine_a = {
            { 'mode', color = function() return { fg = hl_fg 'SkullGlow1', gui = 'bold' } end },
          },

          lualine_b = {
            { 'branch', color = function() return { fg = hl_fg 'SkullGlow2' } end },
          },

          lualine_c = {
            { 'filename', color = function() return { fg = hl_fg 'SkullGlow3' } end },
          },

          lualine_x = {
            { 'filetype', color = function() return { fg = hl_fg 'SkullGlow4' } end },
          },

          lualine_y = {
            { 'progress', color = function() return { fg = hl_fg 'SkullGlowShadow' } end },
          },

          lualine_z = {
            { 'location', color = function() return { fg = hl_fg 'SkullGlowShadow' } end },
          },
        },
      }
    end,
  },
  {
    'SmiteshP/nvim-navic',
    dependencies = { 'neovim/nvim-lspconfig' },
    opts = {
      highlight = true,
      separator = ' › ',
      depth_limit = 5,
    },
  },
}
