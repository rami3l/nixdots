---@diagnostic disable: undefined-global

paneru.setup({
	options = {
		focus_follows_mouse = true,
		mouse_follows_focus = true,
		horizontal_mouse_warp = -1,
	},
	swipe = {
		gesture = {
			fingers_count = 3,
		},
		scroll = {
			modifier = "lalt + shift",
			vertical_modifier = "lctrl + lalt + shift",
		},
	},
	bindings = {
		["quit"] = "lctrl + lalt + shift - q",
		["window focus west"] = "lalt + shift - h",
		["window focus east"] = "lalt + shift - l",
		["window focus north"] = "lalt + shift - k",
		["window focus south"] = "lalt + shift - j",
		["window virtual north"] = "lalt + shift - [",
		["window virtual south"] = "lalt + shift - ]",
		["window swap west"] = "lctrl + lalt + shift - h",
		["window swap east"] = "lctrl + lalt + shift - l",
		["window swap north"] = "lctrl + lalt + shift - k",
		["window swap south"] = "lctrl + lalt + shift - j",
		["window virtualmove north"] = "lctrl + lalt + shift - [",
		["window virtualmove south"] = "lctrl + lalt + shift - ]",
		["window focus first"] = "lalt + shift - i",
		["window focus last"] = "lalt + shift - a",
		["window swap first"] = "lctrl + lalt + shift - i",
		["window swap last"] = "lctrl + lalt + shift - a",
		["window center"] = "lalt + shift - c",
		["window shrink"] = "lalt + shift - ,",
		["window grow"] = "lalt + shift - .",
		["window fullwidth"] = "lalt + shift - z",
		["window manage"] = "lalt + shift - f",
		["window stack"] = "lalt + shift - minus",
		["window unstack"] = "lalt + shift - equal",
	},
	decorations = {
		inactive = {
			dim = {
				opacity = -0.05,
			},
		},
	},
})
