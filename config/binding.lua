local wezterm = require('wezterm')
local act = wezterm.action

local mouse_bindings = {
   -- Ctrl-click will open the link under the mouse cursor
   {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'CTRL',
      action = act.OpenLinkAtMouseCursor,
   },
   -- Ctrl + WheelUp = IncreaseFontSize
    {
        event = { Down = { streak = 1, button = { WheelUp = 1 } } },
        mods = 'CTRL',
        action = act.IncreaseFontSize,
    },
    -- Ctrl + WheelDown = DecreaseFontSize
    {
        event = { Down = { streak = 1, button = { WheelDown = 1 } } },
        mods = 'CTRL',
        action = act.DecreaseFontSize,
    },
}

local keys = {
	{ key = 'l', mods = 'CTRL|SHIFT', action = act.ShowLauncher }, -- 选择启动的shell
}

return {
   mouse_bindings = mouse_bindings,
   keys = keys
}