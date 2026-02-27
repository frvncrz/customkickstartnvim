-- =========================================================
-- Neovide GUI config (transparent, minimal, no bg noise)
-- =========================================================

if not vim.g.neovide then
  return
end

vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- -------------------------
-- Neovide basics
-- -------------------------
vim.o.guifont = "JetBrainsMono Nerd Font:h14"
vim.g.neovide_scale_factor = 1.0
vim.g.neovide_cursor_vfx_mode = "railgun"

-- Transparency (NO blur)
vim.g.neovide_opacity = 0.95
vim.g.neovide_background_color = "#1C1C1C" -- disables transparency
-- vim.g.neovide_window_blurred = true        -- unstable with transparency

-- -------------------------------------------------
-- Mode-aware cursor colors (Neovide)
-- -------------------------------------------------
vim.opt.guicursor = {
  -- Normal mode
  "n-v-c:block-Cursor/lCursor",

  -- Insert mode
  "i-ci:ver25-iCursor",

  -- Visual mode
  "v:hor20-vCursor",

  -- Replace mode
  "r-cr:hor20-rCursor",

  -- Operator-pending
  "o:hor50-oCursor",

  -- Command-line
  "c:ver25-cCursor",
}

-- -------------------------
-- Highlight overrides
-- -------------------------
local function apply_neovide_highlights()
  -- Indent guides (ibl / indent-blankline)
  local indent_groups = {
    "IndentBlanklineChar",
    "IndentBlanklineContextChar",
    "IndentBlanklineContextStart",
    "IblIndent",
    "IblWhitespace",
    "IblScope",

  }

  for _, g in ipairs(indent_groups) do
    vim.api.nvim_set_hl(0, g, { fg = "#202020", bg = "none" })
  end

  -- Neo-tree: remove all backgrounds
  local neotree_groups = {
    "NeoTreeNormal",
    "NeoTreeNormalNC",
    "NeoTreeEndOfBuffer",
    "NeoTreeSignColumn",
    "NeoTreeWinSeparator",
  }

  for _, g in ipairs(neotree_groups) do
    vim.api.nvim_set_hl(0, g, { bg = "none" })
  end

  -- Neo-tree: ONLY active row highlighted
  vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { bg = "#1a1a1a" })

  -- Global UI cleanup
  local ui_groups = {
    "Normal",
    "NormalNC",
    "SignColumn",
    "FoldColumn",
    "LineNr",
    "EndOfBuffer",
    "VertSplit",
    "WinSeparator",
  }

  for _, g in ipairs(ui_groups) do
    vim.api.nvim_set_hl(0, g, { bg = "none" })
  end

  -- Syntax: remove ALL background shading
  local syntax_groups = {
    "Comment", "Constant", "String", "Character", "Number",
    "Boolean", "Float", "Identifier", "Function", "Statement",
    "Conditional", "Repeat", "Label", "Operator", "Keyword",
    "Exception", "PreProc", "Include", "Define", "Macro",
    "Type", "StorageClass", "Structure", "Typedef",
  }

  for _, g in ipairs(syntax_groups) do
    vim.api.nvim_set_hl(0, g, { bg = "none" })
  end

  -- ONLY allowed highlights
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1c1c1c" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#2a2a2a" })
end

-- CursorLine: keep highlight, remove block bleed
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1c1c1c" })
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
vim.api.nvim_set_hl(0, "CursorLineFold", { bg = "none" })
vim.api.nvim_set_hl(0, "CursorLineSign", { bg = "none" })

-- Remove background from Tree-sitter block / scope captures
for _, group in ipairs({
  "@block",
  "@block.outer",
  "@block.inner",
  "@scope",
  "@scope.block",
  "@scope.outer",
  "@scope.inner",
}) do
  vim.api.nvim_set_hl(0, group, {
    bg = "none",
  })
end



-- -------------------------------------------------
-- Mode-aware cursor colors (matched to your palette)
-- -------------------------------------------------

-- Normal mode
vim.api.nvim_set_hl(0, "Cursor", {
  fg = "#000000",
  bg = "#FF9A12", -- normal
})

-- Insert mode
vim.api.nvim_set_hl(0, "iCursor", {
  fg = "#000000",
  bg = "#FF4D4D", -- insert
})

-- Visual mode
vim.api.nvim_set_hl(0, "vCursor", {
  fg = "#000000",
  bg = "#B983FF", -- visual
})

-- Replace mode
vim.api.nvim_set_hl(0, "rCursor", {
  fg = "#000000",
  bg = "#4FC3F7", -- replace
})

-- Command-line mode
vim.api.nvim_set_hl(0, "cCursor", {
  fg = "#000000",
  bg = "#FFD166", -- command
})

-- Make guide / whitespace lines white but subtle
local subtle_groups = {
  "Whitespace",
  "NonText",
  "IblIndent",
  "IblWhitespace",
  "IblScope",
}

for _, g in ipairs(subtle_groups) do
  vim.api.nvim_set_hl(0, g, {
    fg = "#ffffff",
    bg = "none",
    blend = 85,
  })
end

-- Remove Treesitter Context background blocks
vim.api.nvim_set_hl(0, "TreesitterContext", {
  bg = "none",
})

vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", {
  bg = "none",
})

-- -------------------------
-- Apply highlights LAST
-- -------------------------
vim.api.nvim_create_autocmd(
  { "ColorScheme", "VimEnter", "BufWinEnter", "WinEnter" },
  {
    callback = function()
      vim.defer_fn(apply_neovide_highlights, 20)
    end,
  }
)

-- Apply immediately on load
apply_neovide_highlights()
