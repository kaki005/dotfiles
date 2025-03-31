local icons = require("icons")
local colors = require("colors")
local settings = require("settings")


local disk = sbar.add("item", "widgets.disk", {
	position = "right",
	background = {
		height = 22,
		color = { alpha = 0 },
		border_color = { alpha = 0 },
		drawing = true,
	},
	icon = {
		string = icons.cpu,
		color = colors.blue,
	},
	label = {
		string = "??%",
		color = colors.blue,
		font = {
			family = settings.font.numbers,
			-- style = settings.font.style_map["Bold"],
			-- size = 9.0,
		},
		align = "right",
	},
	padding_right = 0,
	padding_left = 5,
})

-- Background around the disk item
local bracket = sbar.add("bracket", "widgets.disk.bracket", {  disk.name }, {
	background = { color = colors.tn_black3, border_color = colors.blue },
})

disk:subscribe("mouse.clicked", function(env)
	sbar.exec("open -a 'Activity Monitor'")
end)


disk:subscribe({
	-- "routine",
	-- "forced",
	-- "system_woke",
    "system_stats",
}, function()
	Sbar.exec("df -H | grep 'dev/disk3s1s' | awk '{ printf (\"%s\\n\", $5) }'", function(diskUsage)
	-- Sbar.exec("ls", function(diskUsage)
		disk:set({ label = diskUsage })
	end)
end)


-- Background around the disk item
sbar.add("item", "widgets.disk.padding", {
	position = "right",
	width = settings.group_paddings,
})
