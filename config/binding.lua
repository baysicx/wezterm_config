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

local keyboard_bindings = {
    -- tmux_leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 },
    -- keys = {
    --     { key = '-', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    --     { key = '\\', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    --     { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection 'Left' },
    --     { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection 'Right' },
    --     { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection 'Up' },
    --     { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection 'Down' },
    -- },
}

return {
   mouse_bindings = mouse_bindings,
   keys = keyboard_bindings,
}