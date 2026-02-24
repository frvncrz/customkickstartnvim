-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '<leader>nt', ':Neotree filesystem toggle<CR>', desc = 'NeoTree: Filesystem', silent = true },
    { '<leader>nf', ':Neotree filesystem reveal<CR>', desc = 'NeoTree: Reveal file', silent = true },
    { '<leader>nb', ':Neotree buffers toggle<CR>', desc = 'NeoTree: Buffers', silent = true },
    { '<leader>ng', ':Neotree git_status toggle<CR>', desc = 'NeoTree: Git status', silent = true },
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['<CR>'] = 'open',
          ['l'] = 'open',
          ['h'] = 'close_node',

          -- Tabs & splits
          ['t'] = {
            'open_tabnew',
            config = { close = true },
          },
          ['s'] = 'open_split',
          ['v'] = 'open_vsplit',

          -- Tree control
          ['R'] = 'refresh',
          ['a'] = 'add',
          ['d'] = 'delete',
          ['r'] = 'rename',
          ['y'] = 'copy_to_clipboard',
          ['x'] = 'cut_to_clipboard',
          ['p'] = 'paste_from_clipboard',

          -- Quit
          ['q'] = 'close_window',
        },
      },

      git_status = {
        symbols = {
          added = '✚',
          modified = '',
          deleted = '✖',
          renamed = '󰁕',
          untracked = '🌱', -- 👈 replaces '?'
          ignored = '◌',
          unstaged = '',
          staged = '✓',
          conflict = '',
        },
      },
    },
  },
}
