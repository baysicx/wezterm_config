local wezterm = require('wezterm')

local default_prog = nil

if wezterm.target_triple:find('windows') then
--   default_prog = { 'powershell.exe' } -- powshell 5
    default_prog = { 'pwsh.exe' } -- powershell 7

end

return { 
    default_prog = default_prog,
}