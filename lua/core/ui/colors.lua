-- lua/ui/colors.lua

local M = {}

-- =========================================================
-- Glow palette (single source of truth)
-- =========================================================
M.glow = {
  normal  = '#FF9A12',
  insert  = '#FF4D4D',
  visual  = '#B983FF',
  replace = '#4FC3F7',
  command = '#FFD166',
  dim     = '#5A2E00',
}

-- Map vim modes to glow keys
local mode_map = {
  n  = 'normal',
  i  = 'insert',
  v  = 'visual',
  V  = 'visual',
  [''] = 'visual',
  R  = 'replace',
  c  = 'command',
}

-- =========================================================
-- Statusline highlight (used by lualine)
-- =========================================================
vim.api.nvim_set_hl(0, 'SkullStatusline', {
  fg = M.glow.normal,
  bold = true,
})


-- =========================================================
-- Cursor color-matching mode
-- =========================================================
vim.opt.guicursor = {
  "n:block-CursorNormal",
  "i:ver25-CursorInsert",
  "v:block-CursorVisual",
  "c:hor20-CursorCommand",
  "R:block-CursorReplace",
}

vim.api.nvim_set_hl(0, "CursorNormal",  { bg = M.glow.normal })
vim.api.nvim_set_hl(0, "CursorInsert",  { bg = M.glow.insert })
vim.api.nvim_set_hl(0, "CursorVisual",  { bg = M.glow.visual })
vim.api.nvim_set_hl(0, "CursorCommand", { bg = M.glow.command })
vim.api.nvim_set_hl(0, "CursorReplace", { bg = M.glow.replace })


-- =========================================================
-- Mode-reactive updater (statusline + winbar)
-- =========================================================
local function update_glow()
  local mode = vim.api.nvim_get_mode().mode
  local key = mode_map[mode] or 'normal'

  -- Statusline
  vim.api.nvim_set_hl(0, 'SkullStatusline', {
    fg = M.glow[key],
    bold = true,
  })

  -- Winbar (active window)
  vim.api.nvim_set_hl(0, 'WinBar', {
    fg = M.glow[key],
    bold = true,
  })

  -- Winbar (inactive windows)
  vim.api.nvim_set_hl(0, 'WinBarNC', {
    fg = M.glow.dim,
  })
end

-- =========================================================
-- Autocmd: keep UI in sync with mode
-- =========================================================
vim.api.nvim_create_autocmd({ 'ModeChanged', 'VimEnter' }, {
  callback = update_glow,
})

-- =========================================================
-- Dashboard stays simple
-- =========================================================
vim.api.nvim_set_hl(0, 'DashboardHeader', {
  fg = '#55806A',
})

return M
