local Config = require('config')

return Config:init()
	:append(require('config.color')) -- color and theme
	:append(require('config.font')) -- font
	:append(require('config.window')) -- window
	:append(require('config.binding')) -- key, mouse
	:append(require('config.platform')) -- platfrom terminal
	.options