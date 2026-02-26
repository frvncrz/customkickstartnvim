-- Nerd Font flag
vim.g.have_nerd_font = true
vim.g.python3_host_prog =
  "/Library/Frameworks/Python.framework/Versions/3.13/bin/python3"

-- ======================
-- Editor Options
-- ======================

vim.o.number = true
vim.o.mouse = 'a'
vim.o.showmode = false
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true

vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.clipboard = 'unnamedplus'
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

-- Clipboard scheduling
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- ======================
-- Diagnostics
-- ======================

vim.diagnostic.config({
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },
  virtual_text = true,
  virtual_lines = false,
  jump = { float = true },
})

-- ======================
-- Keymaps
-- ======================

-- Clear search highlight
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostics quickfix
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic list' })

-- Terminal escape
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move left' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move right' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move down' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move up' })

-- ======================
-- Autocommands
-- ======================

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

require('core.ui.colors')
