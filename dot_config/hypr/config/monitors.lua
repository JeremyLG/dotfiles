-- Monitor wiki https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
	output = MONITOR1,
	mode = "1920x1080@60",
	position = "0x0",
	scale = "1",
})

hl.monitor({
	output = MONITOR2,
	mode = "1920x1080@60",
	position = "1920x0", -- = DP-1 width (1920 / 1.0 scale)
	scale = "1.5",
})
