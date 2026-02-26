-- lua/ui/lualine.lua

local colors = require 'ui.colors'

-- Helper: get fg from highlight group
local function hl_fg(name)
  local hl = vim.api.nvim_get_hl(0, { name = name })
  return hl.fg and string.format('#%06x', hl.fg) or nil
end

-- Mode-reactive color
local mode_map = {
  n = 'normal',
  i = 'insert',
  v = 'visual',
  V = 'visual',
  [''] = 'visual',
  R = 'replace',
  c = 'command',
}

local function mode_color()
  local mode = vim.api.nvim_get_mode().mode
  local key = mode_map[mode] or 'normal'
  return { fg = colors.glow[key], gui = 'bold' }
end

require('lualine').setup {
  options = {
    theme = 'auto',
    section_separators = '',
    component_separators = '',
  },
  sections = {
    lualine_a = {
      { 'mode', color = mode_color },
    },
    lualine_b = {
      { 'branch', color = function() return { fg = hl_fg 'SkullGlow_normal' } end },
    },
    lualine_c = {
      { 'filename', color = function() return { fg = hl_fg 'SkullGlow_visual' } end },
    },
    lualine_x = {
      { 'filetype', color = function() return { fg = hl_fg 'SkullGlow_insert' } end },
    },
    lualine_y = {
      { 'progress', color = function() return { fg = hl_fg 'SkullGlow_dim' } end },
    },
    lualine_z = {
      { 'location', color = function() return { fg = hl_fg 'SkullGlow_dim' } end },
    },
  },
}
