-- 🚫 Kill legacy indent-blankline context globals
vim.g.indent_blankline_show_current_context = false
vim.g.indent_blankline_show_current_context_start = false
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("core.init")
require("core.lazy")
require("gui.neovide")
