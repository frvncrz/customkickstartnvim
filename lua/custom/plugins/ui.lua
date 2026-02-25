return {

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
