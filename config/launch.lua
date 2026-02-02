-- 1. 引入 ssh_loader 模块 (假设文件名为 ssh_loader.lua 且在同级目录或Lua路径下)
local ssh_loader = require('utils.ssh_loader')
local platform = require('utils.platform')

local options = {
    default_prog = {},
    launch_menu = {},
}

-- 平台判断逻辑 (保持不变)
if platform.is_win then
    options.default_prog = { 'pwsh', '-NoLogo' }
    options.launch_menu = {
        { label = 'PowerShell 7',   args = { 'pwsh' } },
        { label = 'PowerShell 5',   args = { 'powershell' } },
        { label = 'PowerShell 5 -NoLogo',   args = { 'powershell', '-NoLogo' } },
        { label = 'Command Prompt', args = { 'cmd' } },
    }
elseif platform.is_linux then
    options.default_prog = { 'fish', '-l' }
    options.launch_menu = {
        { label = 'Bash', args = { 'bash', '-l' } },
    }
    -- elseif platform.is_mac then
    -- Mac logic...
end


-- 2. 拼接 SSH 菜单逻辑 (写在 return 之前)
-- 获取动态生成的 SSH 列表，参数可选 "simple" 或 "detailed"
-- 这里使用 "detailed" 以显示你喜欢的 "SSH -> 36: user@ip" 格式
local ssh_items = ssh_loader.get_ssh_hosts("detailed")

-- 遍历 SSH 列表并插入到 options.launch_menu 中
for _, item in ipairs(ssh_items) do
    table.insert(options.launch_menu, item)
end


return options
