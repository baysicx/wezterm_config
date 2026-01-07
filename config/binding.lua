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
	-- { key = 'l', mods = 'CTRL|SHIFT', action = act.ShowLauncher }, -- 选择启动的shell
    { key = 'a', mods = 'CTRL', action = wezterm.action.ActivateKeyTable { name = 'mode_a', one_shot = true } },
}

local key_tables = {
    mode_a = {
        { key = 'c', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
        { key = 'x', action = wezterm.action.CloseCurrentPane { confirm = true } },
    },
}

return {
   mouse_bindings = mouse_bindings,
   keys = keys,
   key_tables = key_tables,
}