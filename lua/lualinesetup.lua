

local custom_seoul256 = require'lualine.themes.seoul256'

-- Change the background of lualine_c section for normal mode
custom_seoul256.normal.b.bg = '#c5c5c5'
custom_seoul256.normal.b.fg = '#474747'
custom_seoul256.normal.c.bg = '#d9d9d9'
custom_seoul256.insert.b.bg = '#c5c5c5'
custom_seoul256.insert.b.fg = '#474747'
custom_seoul256.visual.b.bg = '#c5c5c5'
custom_seoul256.visual.b.fg = '#474747'
custom_seoul256.inactive.c.bg = '#d9d9d9'


require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = custom_seoul256,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {{'filename', path = 3}},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
