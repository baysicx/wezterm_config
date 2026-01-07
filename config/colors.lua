local wezterm = require('wezterm')
local theme_colors = require('colors.custom')

local color = {}
local color_scheme = 'Dracula'
-- local color_scheme = 'Catppuccin Mocha'


return {
    color_scheme = color_scheme,
    colors = {
        scrollbar_thumb = theme_colors.silver,
        tab_bar = {
            background = theme_colors.fg,
        },
    },
}



-- colors.scrollbar_thumb = colors.bright_green

-- local color_scheme = 'Catppuccin Mocha'
-- local color_scheme = 'One Dark (Gogh)'
-- local color_scheme = 'One Dark'
-- local color_scheme = 'One Half Black (Gogh)'
-- local color_scheme = 'Tokyo Night'