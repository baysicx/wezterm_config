-- Pull in the wezterm API
local wezterm = require('wezterm')

wezterm.on('gui-startup', function(cmd)
  local screen = wezterm.gui.screens().active

  local ratio = 1.6

  local window_width = screen.width / ratio
  local window_height = screen.height / ratio
  
  local tab, pane, window = wezterm.mux.spawn_window(cmd or {
    position = {
      x = (screen.width - window_width) / 2,
      y = (screen.height - window_height) / 2,
      origin = 'ActiveScreen'
    }
  })
  
  -- 设置窗口实际大小
  window:gui_window():set_inner_size(window_width, window_height)
end)

-- 缩放字体但是不缩放窗口
local adjust_window_size_when_changing_font_size = false

return {
	adjust_window_size_when_changing_font_size = adjust_window_size_when_changing_font_size
}

-- local initial_cols = 120
-- local initial_rows = 40

-- return {
-- 	initial_cols = initial_cols,
-- 	initial_rows = initial_rows,
-- }