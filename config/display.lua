local wezterm = require('wezterm')
local gpu_adapters = require('utils.gpu-adapter')
local theme_colors = require('colors.custom')

local font_family = 'JetBrainsMono Nerd Font'
local font_size = 16

return {
   -- render
   max_fps = 120, -- 最大帧率
   front_end = 'WebGpu', ---@type 'WebGpu' | 'OpenGL' | 'Software' 引擎
   webgpu_power_preference = 'HighPerformance', -- 性能模式
   webgpu_preferred_adapter = gpu_adapters:pick_best(), -- 根据gpu自动选adapter

   -- font
   font = wezterm.font({
      family = font_family,
      weight = 'Medium',
   }),
   font_size = font_size,

   -- underline
   underline_thickness = '1.5pt',

   -- --tab font
   -- window_frame = {
   --    font = wezterm.font({
   --       family = font_family,
   --       weight = 'Medium',
   --    }),
   --    font_size = font_size + 20,  -- tab 栏字体大小
   -- },

   -- background, not support webgpu
   -- window_background_opacity = 0.8,
   -- macos_window_background_blur = 5,
   -- win32_system_backdrop = "Acrylic",


   -- cursor
   animation_fps = 120,
   cursor_blink_ease_in = 'EaseOut',
   cursor_blink_ease_out = 'EaseOut',

   -- 光标闪烁
   default_cursor_style = 'BlinkingBar', ---@type 'SteadyBlock'|'BlinkingBar'|'BlinkingBlock'|'BlinkingUnderline'
   cursor_blink_rate = 1000,

   -- 方块闪烁
--    default_cursor_style = 'BlinkingBlock', 
--    cursor_blink_rate = 650,

   -- scrollbar
   enable_scroll_bar = true, -- 滚动条

   -- tab bar
   enable_tab_bar = true, -- 启用标签栏显示
   hide_tab_bar_if_only_one_tab = false, -- 即使只有一个标签页也显示标签栏
   use_fancy_tab_bar = false, -- 使用简洁的标签栏样式，而非带装饰的"花哨"样式
   tab_max_width = 25, -- 每个标签的最大宽度为 25 个字符
   show_tab_index_in_tab_bar = false, -- 不显示序号
   switch_to_last_active_tab_when_closing_tab = true, -- 关闭当前标签后，跳转到上一个活跃的标签页

   -- command palette
   command_palette_fg_color = theme_colors.white,
   command_palette_bg_color = theme_colors.gray,
   command_palette_font_size = font_size + 4,
   command_palette_rows = 10,

   -- window
   window_decorations = "RESIZE", ---@type "INTEGRATED_BUTTONS|RESIZE"|"RESIZE"
   window_padding = {
      left = 10,
      right = 10,
      top = 10,
      bottom = 10,
   },
   adjust_window_size_when_changing_font_size = false, -- 改变字体大小时不自动调整窗口尺寸
   window_close_confirmation = 'NeverPrompt', -- 关闭窗口时不弹出确认提示，直接关闭
   -- window_frame = {
   --    active_titlebar_bg = theme_colors.fg,
   --    font = fonts.font,
   --    font_size = font_size+5,
   -- },
   -- inactive_pane_hsb = {
   --    saturation = 1, -- 饱和度
   --    brightness = 1, -- 亮度
   -- },

   -- visual warning bell
   visual_bell = {
      fade_in_function = 'EaseIn',
      fade_in_duration_ms = 250,
      fade_out_function = 'EaseOut',
      fade_out_duration_ms = 250,
      target = 'CursorColor', ---@type 'BackgroundColor'|'CursorColor'
   },
}