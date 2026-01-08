-- ~/.config/wezterm/events/scroll.lua
local wezterm = require 'wezterm'
local M = {}

local default_multiplier = 0.3

---@param opts? { multiplier?: number }
M.setup = function(opts)
   opts = opts or {}
   default_multiplier = opts.multiplier or 0.3
end

---@param direction number 1 向下，-1 向上
---@param multiplier? number 覆盖默认比例
M.fast_scroll = function(direction, multiplier)
   multiplier = multiplier or default_multiplier
   return wezterm.action_callback(function(window, pane)
      local tab = window:active_tab()
      local size = tab:get_size()
      local rows = size.rows
      
      wezterm.log_info('rows:', rows, 'multiplier:', multiplier)
      
      local lines = math.floor(rows * multiplier)
      window:perform_action(
         wezterm.action.ScrollByLine(direction * lines),
         pane
      )
   end)
end

return M