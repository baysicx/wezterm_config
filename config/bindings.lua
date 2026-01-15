local wezterm = require('wezterm')
local scroll = require('events.scroll')
local act = wezterm.action

local mouse_bindings = {
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
    -- fast scroll
    {
        event = { Down = { streak = 1, button = { WheelUp = 1 } } },
        mods = 'ALT',
        action = scroll.fast_scroll(-1, 0.5),
    },
    {
        event = { Down = { streak = 1, button = { WheelDown = 1 } } },
        mods = 'ALT',
        action = scroll.fast_scroll(1, 0.5),
    },
}

local keys = {
    -- { key = 'l', mods = 'CTRL|SHIFT', action = act.ShowLauncher }, -- 选择启动的shell
    {
        key = 'a',
        mods = 'CTRL',
        action = act.ActivateKeyTable
            {
                name = 'custom',
                one_shot = false,
                -- timeout_milliseconds = 2000,
            }
    },
    { key = 'p',      mods = 'CTRL|SHIFT',          action = act.ActivateCommandPalette, },

    -- copy and paste
    { key = 'c',      mods = 'CTRL|SHIFT',          action = act.CopyTo('Clipboard') },
    { key = 'v',      mods = 'CTRL|SHIFT',          action = act.PasteFrom('Clipboard') },

    -- linux copy and paste
    { key = 'Insert', mods = 'CTRL',                action = act.CopyTo('Clipboard') },
    { key = 'Insert', mods = 'SHIFT',               action = act.PasteFrom('Clipboard') },


    -- clear
    { key = 'l',      mods = 'CTRL|SHIFT',          action = act.ClearScrollback('ScrollbackAndViewport') },

    -- tab
    { key = 'Tab',    mods = 'CTRL',                action = act.ActivateTabRelative(1) },
    { key = 'Tab',    mods = 'CTRL|SHIFT',          action = act.ActivateTabRelative(-1) },

    -- font
    { key = '=',      mods = 'CTRL',                action = act.IncreaseFontSize },
    { key = '-',      mods = 'CTRL',                action = act.DecreaseFontSize },
    { key = '0',      mods = 'CTRL',                action = act.ResetFontSize },

    -- debug mode
    { key = 'F12',    action = act.ShowDebugOverlay },
}

local key_tables = {
    -- timeout_milliseconds = 2000,
    custom = {

        { key = 'c',      action = act.ActivateCopyMode, },                                       -- copy mode
        { key = 'f',      action = act.Search('CurrentSelectionOrEmptyString') },                 -- find mode

        { key = 'p',      action = act.ActivateKeyTable { name = 'pane', one_shot = false, } },   -- pane
        { key = 's',      action = act.ActivateKeyTable { name = 'scroll', one_shot = false, } }, -- 翻页 scroll
        { key = 't',      action = act.ActivateKeyTable { name = 'tab', one_shot = false, } },    -- 进入 tab 子菜单
        { key = 'w',      action = act.ActivateKeyTable { name = 'window', one_shot = false, } }, -- window 控制

        { key = 'q',      action = wezterm.action.PopKeyTable },
        { key = 'Escape', action = act.ClearKeyTableStack },
    },
    scroll = {
        { key = '[',      action = act.ScrollByPage(-0.5) }, -- 上翻半页
        { key = ']',      action = act.ScrollByPage(0.5) },  -- 下翻半页

        { key = '-',      action = act.ScrollByPage(-0.5) }, -- 上翻半页
        { key = '=',      action = act.ScrollByPage(0.5) },  -- 下翻半页

        { key = 't',      action = act.ScrollToTop },
        { key = 'b',      action = act.ScrollToBottom },

        { key = 'q',      action = wezterm.action.PopKeyTable },
        { key = 'Escape', action = act.ClearKeyTableStack },
    },
    pane = {
        { key = '-',      action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
        { key = '5',      action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },

        { key = 'h',      action = act.ActivatePaneDirection('Left') },
        { key = 'l',      action = act.ActivatePaneDirection('Right') },
        { key = 'j',      action = act.ActivatePaneDirection('Down') },
        { key = 'k',      action = act.ActivatePaneDirection('Up') },

        { key = 's',      action = act.PaneSelect { mode = 'SwapWithActive' } },
        { key = 'x',      action = act.CloseCurrentPane { confirm = true } },
        { key = 'f',      action = act.TogglePaneZoomState }, -- 最大化当前pane

        { key = 'q',      action = wezterm.action.PopKeyTable },
        { key = 'Escape', action = act.ClearKeyTableStack },
    },
    tab = {
        { key = 'n',      action = act.EmitEvent('tabs.manual-update-tab-title') },             -- 重命名tab
        { key = 'r',      action = act.EmitEvent('tabs.reset-tab-title') },                     -- 恢复tab title
        { key = 't',      action = act.EmitEvent('tabs.toggle-tab-bar') },                      -- 隐藏tab栏
        { key = 'c',      action = act.SpawnTab('CurrentPaneDomain') },                         -- 创建新tab
        { key = 'a',      action = act.ShowLauncherArgs { flags = 'TABS|LAUNCH_MENU_ITEMS' } }, --带有args创建新tab
        { key = 'x',      action = act.CloseCurrentTab { confirm = true } },                    -- 关闭当前tab

        -- Tab 左右移动
        { key = '[',      action = act.MoveTabRelative(-1) }, -- tab左移
        { key = ']',      action = act.MoveTabRelative(1) },  -- tab右移

        -- -- 移动到指定位置（索引从 0 开始）
        -- { key = '0',      action = act.MoveTab(0) }, -- 移到最左，0位置
        -- { key = '1',      action = act.MoveTab(1) },
        -- { key = '2',      action = act.MoveTab(2) },
        -- { key = '3',      action = act.MoveTab(3) },
        -- { key = '4',      action = act.MoveTab(4) },

        { key = '1',      action = act.ActivateTab(0) },
        { key = '2',      action = act.ActivateTab(1) },
        { key = '3',      action = act.ActivateTab(2) },
        { key = '4',      action = act.ActivateTab(3) },
        { key = '5',      action = act.ActivateTab(4) },
        { key = '6',      action = act.ActivateTab(5) },
        { key = '7',      action = act.ActivateTab(6) },
        { key = '8',      action = act.ActivateTab(7) },
        { key = '9',      action = act.ActivateTab(8) },
        { key = '0',      action = act.ActivateTab(-1) },

        { key = 'q',      action = wezterm.action.PopKeyTable },
        { key = 'Escape', action = act.ClearKeyTableStack },
    },
    window = {
        { key = 'x',      action = act.QuitApplication },  -- 关闭window
        { key = 'f',      action = act.ToggleFullScreen }, -- 最大化window
        { key = 'h',      action = act.Hide },             -- 最小化window

        { key = 'q',      action = wezterm.action.PopKeyTable },
        { key = 'Escape', action = act.ClearKeyTableStack },
    },
}

return {
    disable_default_key_bindings = true,
    keys = keys,
    key_tables = key_tables,
    mouse_bindings = mouse_bindings,
}
