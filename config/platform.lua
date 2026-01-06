local wezterm = require('wezterm')

local default_prog = nil
local launch_menu = nil

if wezterm.target_triple:find('windows') then
	default_prog = { 'pwsh', '-NoLogo' }
	
	launch_menu = {
        { label = 'PowerShell 7', args = { 'pwsh', '-NoLogo' } },
        { label = 'PowerShell 5', args = { 'powershell', '-NoLogo' } },
        { label = 'Command Prompt', args = { 'cmd' } },
    }
	
    -- local f = io.open(os.getenv('ProgramFiles') .. '\\PowerShell\\7\\pwsh.exe', 'r')
    --if f then
        --f:close()
        --default_prog = { 'pwsh.exe' }
    --else
        --default_prog = { 'powershell.exe' }
    --end
end

return { 
    default_prog = default_prog,
	launch_menu = launch_menu,
}