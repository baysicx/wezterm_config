local Config = require('config')

require('events.left-status').setup()
require('events.right-status').setup({ date_format = '%m-%d %a %H:%M' })
require('events.tab-title').setup({ unseen_icon = 'numbered_box' })
require('events.new-tab-button').setup()
require('events.gui-startup').setup( { ratio = 1.6 } ) -- 设置缩放

-- return {}
return Config:init()
	:append(require('config.bindings'))
	:append(require('config.colors'))
	:append(require('config.display'))
	:append(require('config.domains'))
	:append(require('config.launch'))
	:append(require('config.general'))
	.options