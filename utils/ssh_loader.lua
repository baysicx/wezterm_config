-- ssh_loader.lua
local wezterm = require('wezterm')

local M = {}

-- mode 参数:
-- "simple"   => 显示 "SSH -> 36"
-- "detailed" => 显示 "SSH -> 36: baishengyuan@192.168.80.36"
function M.get_ssh_hosts(mode)
  -- 默认为 simple 模式
  mode = mode or "simple"
  
  local ssh_config_file = wezterm.home_dir .. "/.ssh/config"
  local menu_items = {}
  
  local f = io.open(ssh_config_file, "r")
  if not f then return menu_items end

  -- 临时变量，用来存当前正在解析的 Host 信息
  local current_entry = nil

  -- 辅助函数：把收集好的 entry 格式化并插入菜单
  local function flush_entry()
    if not current_entry then return end
    
    -- 只有当 alias 存在且不是通配符 * 时才处理
    if current_entry.alias and current_entry.alias ~= "*" and not current_entry.alias:find("[*?]") then
      local label = ""
      
      -- 定义统一的前缀风格
      local prefix = "SSH -> "

      if mode == "detailed" then
        -- 格式: SSH -> 别名: user@ip
        local user_part = current_entry.user or "root" -- 默认user fallback
        local host_part = current_entry.hostname or "unknown"
        
        label = string.format("%s%s: %s@%s", prefix, current_entry.alias, user_part, host_part)
      else
        -- 格式: SSH -> 别名
        label = prefix .. current_entry.alias
      end

      table.insert(menu_items, {
        label = label,
        args = { 'ssh', current_entry.alias },
      })
    end
  end

  for line in f:lines() do
    -- 1. 检测是否是新的一段 Host 开始
    local new_host = line:match("^%s*[Hh][Oo][Ss][Tt]%s+(.+)")
    
    if new_host then
      -- 遇到新 Host 前，先把上一个 Host 存起来
      flush_entry()
      
      -- 开始记录新的
      -- 注意：如果一行有多个别名 "Host dev prod"，这里只取第一个以简化显示
      local first_alias = new_host:match("%S+")
      current_entry = { 
        alias = first_alias, 
        hostname = nil, 
        user = nil 
      }
    
    elseif current_entry then
      -- 2. 如果当前正在一个块里，尝试抓取 HostName
      local hostname = line:match("^%s*[Hh][Oo][Ss][Tt][Nn][Aa][Mm][Ee]%s+(.+)")
      if hostname then current_entry.hostname = hostname end

      -- 3. 尝试抓取 User
      local user = line:match("^%s*[Uu][Ss][Ee][Rr]%s+(.+)")
      if user then current_entry.user = user end
    end
  end

  -- 循环结束，别忘了把最后一个 Host 存进去
  flush_entry()
  
  f:close()
  return menu_items
end

return M