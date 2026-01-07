local Config = require('config')

require('events.left-status').setup()
require('events.right-status').setup({ date_format = '%m-%d %a %H:%M' }) -- %a %H:%M:%S
require('events.tab-title').setup({ hide_active_tab_unseen = false, unseen_icon = 'numbered_box' })
require('events.new-tab-button').setup()
require('events.gui-startup').setup( { ratio = 1.6 } ) -- 设置缩放

-- return {}
return Config:init()
	:append(require('config.binding'))
	:append(require('config.colors'))
	:append(require('config.display'))
	:append(require('config.domains'))
	:append(require('config.general'))
	:append(require('config.launch')).options