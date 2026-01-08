local theme_colors = require('colors.custom')

local color_scheme = 'Dracula'
-- local color_scheme = 'Catppuccin Mocha'


return {
    color_scheme = color_scheme,
    colors = {
        scrollbar_thumb = theme_colors.silver,
        tab_bar = {
            background = theme_colors.fg,
        },
        -- 不激活的 pane 颜色调整
        inactive_pane_hsb = {
            saturation = 0.9,  -- 饱和度，1.0 是原色，越小越灰
            brightness = 0.6,  -- 亮度，1.0 是原色，越小越暗
            hue = 1.0,         -- 色相，1.0 不变
        },
    },
}



-- colors.scrollbar_thumb = colors.bright_green

-- local color_scheme = 'Catppuccin Mocha'
-- local color_scheme = 'One Dark (Gogh)'
-- local color_scheme = 'One Dark'
-- local color_scheme = 'One Half Black (Gogh)'
-- local color_scheme = 'Tokyo Night'