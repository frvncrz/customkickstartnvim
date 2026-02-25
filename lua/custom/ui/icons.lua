-- lua/ui/icons.lua

local devicons = require 'nvim-web-devicons'

devicons.set_icon {
  java = {
    icon = '☕',
    color = '#f89820',
    name = 'Java',
  },
  lua = {
    icon = '🌙',
    color = '#51a0cf',
    name = 'Lua',
  },
  py = {
    icon = '🐍',
    color = '#3572A5',
    name = 'Python',
  },
  js = {
    icon = '',
    color = '#f7df1e',
    name = 'JavaScript',
  },
  ts = {
    icon = '󰛦',
    color = '#3178c6',
    name = 'TypeScript',
  },
  html = {
    icon = '',
    color = '#e34c26',
    name = 'HTML',
  },
  css = {
    icon = '', -- this is U+E6B8 if your font maps it that way
    color = '#563d7c',
    name = 'CSS',
  },
}
