return {
   -- behaviours
   automatically_reload_config = true,
   exit_behavior = 'CloseOnCleanExit', -- if the shell program exited with a successful status
   exit_behavior_messaging = 'Verbose',
   status_update_interval = 1000,
   audible_bell = 'Disabled',
   use_ime = false, -- force en-us keyboard

   -- -- mac lose point
   -- swallow_mouse_click_on_window_focus = true,
   -- enable_csi_u_key_encoding = false,

   scrollback_lines = 3500, --wezterm default number

   hyperlink_rules = {
      -- 各种括号包裹的 URL：(URL) [URL] {URL} <URL>
      {
         regex = '[(\\[{<](\\w+://\\S+)[)\\]}>]',
         format = '$1',
         highlight = 1,
      },

      -- 裸 URL（带协议）
      {
         regex = '\\b\\w+://\\S+[/\\w_~:?#@!$&\'()*+,;=%-]+',
         format = '$0',
      },

      -- 隐式 mailto 链接
      {
         regex = '\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b',
         format = 'mailto:$0',
      },

      -- 裸域名（TLD 白名单，example.com 可识别，xxx.json 不会）
      {
         regex =
         '\\b[a-zA-Z0-9][-a-zA-Z0-9]*(\\.[a-zA-Z0-9-]+)*\\.(com|org|net|io|dev|edu|gov|cn|co|uk|de|fr|jp|me|tech|cloud|info|biz|xyz)\\b[/\\w._~:?#@!$&\'()*+,;=%-]*',
         format = 'https://$0',
      },
   },
}
