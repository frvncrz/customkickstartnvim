-- lua/ui/colors.lua

local M = {}

M.glow = {
  normal = '#FF9A12',
  insert = '#FF4D4D',
  visual = '#B983FF',
  replace = '#4FC3F7',
  command = '#FFD166',
  dim = '#5A2E00',
}

-- Glow highlight groups
for name, color in pairs(M.glow) do
  vim.api.nvim_set_hl(0, 'SkullGlow_' .. name, {
    fg = color,
    bold = true,
  })
end

-- Dashboard stays simple
vim.api.nvim_set_hl(0, 'DashboardHeader', {
  fg = '#55806A',
})

return M
