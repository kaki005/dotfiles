local colors = require 'colors'

local popup_toggle = 'sketchybar --set $NAME popup.drawing=toggle'

local apple_logo = sbar.add('item', 'apple_logo', {
	click_script = popup_toggle,
	icon = {
		string = '􀣺',
		font = {
			size = 16.0,
		},
		color = colors.mauve,
	},
	label = { drawing = false },
	popup = { height = 35 }
})

local apple_prefs = sbar.add('item', 'apple_prefs', {
	position = 'popup.' .. apple_logo.name,
	icon = '􀺽',
	label = 'Preferences',
})

apple_prefs:subscribe('mouse.clicked', function(_)
	sbar.exec("open -a 'System Preferences'")
	apple_logo:set({ popup = { drawing = false } })
end)


local lock_screen = sbar.add('item', 'lock_screen', {
	position = 'popup.' .. apple_logo.name,
	icon = '􀒳',
	label = 'lock screen',
})

lock_screen:subscribe('mouse.clicked', function(_)
	sbar.exec("pmset displaysleepnow")
	apple_logo:set({ popup = { drawing = false } })
end)


local shutdown = sbar.add('item', 'shutdown', {
	position = 'popup.' .. apple_logo.name,
	icon = '',
	label = 'shut down',
})

shutdown:subscribe('mouse.clicked', function(_)
	sbar.exec("pmset shutdown")
	apple_logo:set({ popup = { drawing = false } })
end)

local restart = sbar.add('item', 'restart', {
	position = 'popup.' .. apple_logo.name,
	icon = '',
	label = 'restart',
})

restart:subscribe('mouse.clicked', function(_)
	sbar.exec("pmset shutdown -r")
	apple_logo:set({ popup = { drawing = false } })
end)
