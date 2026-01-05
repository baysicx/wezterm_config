-- Pull in the wezterm API
local wezterm = require('wezterm')

local font_family = 'JetBrainsMono Nerd Font' -- 'JetBrainsMono Nerd Font'
local font_size = 14

return {
   font = wezterm.font({
      family = font_family,
      weight = 'Medium',
   }),
   font_size = font_size,

   --tab
   window_frame = {
      -- font = wezterm.font({
      --    -- family = font_family,
      --    weight = 'Medium',
      -- }),
      font_size = font_size + 1,  -- tab 栏字体大小
   },
}