local colors = require 'colors'
local settings = require 'settings'

sbar.exec(
	'killall stats_provider >/dev/null; stats_provider -a')

local items = {
	-- { name = 'arch', icon = '', env = 'ARCH' },
	-- { name = 'cpu_count', icon = '󰻠 #', env = 'CPU_COUNT' },
	-- { name = 'cpu_frequency', icon = '󰻠 Freq', env = 'CPU_FREQUENCY' },
	-- { name = 'cpu_usage', icon = '󰻠', env = 'CPU_USAGE' },
	-- { name = 'cpu_temp', icon = '', env = 'CPU_TEMP' },
	-- { name = 'disk_count', icon = '󰋊 #', env = 'DISK_COUNT' },
	-- { name = 'disk_free', icon = '󰋊 Free', env = 'DISK_FREE' },
	-- { name = 'disk_used', icon = '󰋊 Used', env = 'DISK_USED' },
	-- { name = 'disk_total', icon = '󰋊 Tot', env = 'DISK_TOTAL' },
	-- { name = 'disk_usage', icon = '󰋊', env = 'DISK_USAGE' },
	-- { name = 'distro', icon = '', env = 'DISTRO' },
	-- { name = 'host_name', icon = '', env = 'HOST_NAME' },
	-- { name = 'kernel_version', icon = '', env = 'KERNEL_VERSION' },
	-- { name = 'network_tx', icon = '', env = 'NETWORK_TX_en0' },
	-- { name = 'network_rx', icon = '', env = 'NETWORK_RX_en0' },
	-- { name = 'os_version', icon = '', env = 'OS_VERSION' },
	-- { name = 'long_os_version', icon = '', env = 'LONG_OS_VERSION' },
	-- { name = 'ram_available', icon = ' Avail', env = 'RAM_AVAILABLE' },
	-- { name = 'ram_used', icon = ' Used', env = 'RAM_USED' },
	-- { name = 'ram_total', icon = ' Tot', env = 'RAM_TOTAL' },
	-- { name = 'ram_usage', icon = '', env = 'RAM_USAGE' },
	-- { name = 'swp_free', icon = ' Free', env = 'SWP_FREE' },
	-- { name = 'swp_used', icon = ' Used', env = 'SWP_USED' },
	-- { name = 'swp_total', icon = ' Tot', env = 'SWP_TOTAL' },
	-- { name = 'swp_usage', icon = '', env = 'SWP_USAGE' },
	-- { name = 'system_name', icon = '', env = 'SYSTEM_NAME' },
	-- { name = 'uptime', icon = '', env = 'UPTIME' },
}

local item_names = {}

for _, item in ipairs(items) do
	local item_name = item.name
	local item_env = item.env

	local created_item = sbar.add('item', item_name, {
		position = 'right',
		icon = {
			string = item.icon,
			font = { family = settings.font.numbers, style = settings.font.style_map['Bold'], size = 14.0 },
			color = colors.pink,
			padding_right = 0
		},
		label = {
			font = { family = settings.font.text, style = settings.font.style_map['Bold'], size = 14.0 },
			color = colors.pink,
		},
		padding_left = 3,
		padding_right = 3,
	})

	created_item:subscribe('system_stats', function(env)
		created_item:set { label = env[item_env] }
	end)

	-- Store item name for the bracket
	table.insert(item_names, item_name)
end

-- Add items to bracket
sbar.add('bracket', 'stats', item_names, {
	background = { color = colors.surface0, border_color = colors.pink, height = 24, corner_radius = 10 },
})
