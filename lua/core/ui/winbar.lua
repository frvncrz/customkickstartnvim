-- lua/ui/winbar.lua

-- local colors = require 'ui.colors'

-- lua/ui/winbar.lua

local M = {}

vim.g.actual_curwin = vim.api.nvim_get_current_win()

-- Reuse glow colors defined in ui.colors
local mode_colors = {
  n = 'SkullGlow_normal',
  i = 'SkullGlow_insert',
  v = 'SkullGlow_visual',
  V = 'SkullGlow_visual',
  [''] = 'SkullGlow_visual',
  R = 'SkullGlow_replace',
  c = 'SkullGlow_command',
}

local inactive_hl = 'SkullGlow_dim'

-- Truncate breadcrumbs from the left if too long
local function truncate(text, max)
  if #text <= max then return text end
  return '… ' .. text:sub(#text - max + 1)
end

-- Render function used by winbar
local navic = require 'nvim-navic'

function M.render()
  if vim.bo.buftype ~= '' then return '' end

  local is_active = true
  local mode = vim.api.nvim_get_mode().mode

  local hl = inactive_hl
  if is_active then hl = mode_colors[mode] or 'SkullGlow_normal' end

  local filename = string.format('%%#%s# %%f ', hl)

  if navic.is_available() then
    local breadcrumb_hl = is_active and hl or 'Comment'
    local location = navic.get_location()
    local max_width = math.floor(vim.o.columns * 0.6)

    location = truncate(location, max_width)
    return filename .. string.format('%%#%s# %s', breadcrumb_hl, location)
  end

  return filename
end

-- Attach winbar
vim.o.winbar = "%{%v:lua.require('core.ui.winbar').render()%}"

return M
