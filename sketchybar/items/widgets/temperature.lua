local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

-- Execute the event provider binary which provides the event "temp_update" for
-- the temp load data, which is fired every 2.0 seconds.
sbar.exec("killall temp_read >/dev/null; $CONFIG_DIR/helpers/event_providers/temp_read/bin/temp_read temp_update 2.0")

local temp = sbar.add("graph", "widgets.temp", 42, {
	position = "right",
	graph = { color = colors.blue },
	background = {
		height = 22,
		color = { alpha = 0 },
		border_color = { alpha = 0 },
		drawing = true,
	},
	icon = { string = icons.temp },
	label = {
		string = "temp ??°C",
		font = {
			family = settings.font.numbers,
			style = settings.font.style_map["Bold"],
			size = 9.0,
		},
		align = "right",
		padding_right = 0,
		width = 0,
		y_offset = 4,
	},
	padding_right = settings.paddings + 6,
})

temp:subscribe("temp_update", function(env)
	-- Also available: env.user_load, env.sys_load
	local load = tonumber(env.temp)
	temp:push({ load / 100. })

	local color = colors.blue
	if load > 50 then
		if load < 60 then
			color = colors.yellow
		elseif load < 70 then
			color = colors.orange
		else
			color = colors.red
		end
	end

	temp:set({
		graph = { color = color },
		label = env.temp .. "°C",
	})
end)

temp:subscribe("mouse.clicked", function(env)
	sbar.exec("open -a 'Macs Fan Control.app'")
end)

-- Background around the temp item
sbar.add("bracket", "widgets.temp.bracket", { temp.name }, {
	background = { color = colors.bg1 },
})

-- Background around the temp item
sbar.add("item", "widgets.temp.padding", {
	position = "right",
	width = settings.group_paddings,
})
