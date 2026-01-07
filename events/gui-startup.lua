local wezterm = require('wezterm')
local mux = wezterm.mux

local M = {}

M.setup = function(opts)
    opts = opts or {}
    local ratio = opts.ratio or 1.6
    local maximize = opts.maximize or false

    wezterm.on('gui-startup', function(cmd)
        if maximize then
            local _, _, window = mux.spawn_window(cmd or {})
            window:gui_window():maximize()
        else
            local screen = wezterm.gui.screens().active
            local width = screen.width / ratio
            local height = screen.height / ratio

            local _, _, window = mux.spawn_window(cmd or {
                position = {
                    x = (screen.width - width) / 2,
                    y = (screen.height - height) / 2,
                    origin = 'ActiveScreen'
                }
            })
            window:gui_window():set_inner_size(width, height)
        end
    end)
end

return M