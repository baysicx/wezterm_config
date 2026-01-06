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

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local pane = tab.active_pane
  local title = pane.title or ''
  local process = pane.foreground_process_name or ''
  process = process:gsub('.*\\', ''):gsub('.*/', '')

  -- 获取当前主题的调色板
  local scheme = wezterm.color.get_builtin_schemes()[config.color_scheme]
  if not scheme then
    scheme = { ansi = {}, brights = {} }
  end

  -- local color1 = '#7aa2f7'
  -- local color2 = '#9ece6a'
  -- local color3 = '#bb9af7'

  local color1 = scheme.brights[7] or scheme.ansi[7]  -- ssh 命令（青色）
  local color2 = scheme.brights[3] or scheme.ansi[3]  -- host（绿色）
  local color3 = scheme.brights[6] or scheme.ansi[6]  -- 进程名（紫色）

  -- 检测是否是 ssh 进程
  if process:lower():match('^ssh') then
    local host = title:match('@([%d%.]+)') or
                 title:match('@([%w%-%.]+)') or
                 title:match('ssh%s+([%d%.]+)') or
                 title:match('ssh%s+([%w%-%.]+)')
    
    if host then
      return {
        { Foreground = { Color = color1 } },
        { Text = ' ssh ' },
        { Foreground = { Color = color2 } },
        { Text = host .. ' ' },
      }
    else
      return ' ' .. title .. ' '
    end
  end

  -- 非 SSH：进程名带颜色
  return {
    { Foreground = { Color = color3 } },
    { Text = ' ' .. process .. ' ' },
  }
end)

-- 缩放字体但是不缩放窗口
local adjust_window_size_when_changing_font_size = false
local window_decorations = "INTEGRATED_BUTTONS | RESIZE"
local window_background_opacity = 1
-- local use_fancy_tab_bar = false -- 简洁风格
-- local tab_bar_at_bottom = true -- 放底部
-- local hide_tab_bar_if_only_one_tab = true --单 tab 时隐藏

return {
	adjust_window_size_when_changing_font_size = adjust_window_size_when_changing_font_size,
  window_decorations = window_decorations,
  window_background_opacity = window_background_opacity,
}

-- local initial_cols = 120
-- local initial_rows = 40

-- return {
-- 	initial_cols = initial_cols,
-- 	initial_rows = initial_rows,
-- }