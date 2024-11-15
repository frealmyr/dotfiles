local wezterm = require("wezterm")

local wezterm = require("wezterm")
function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Dracula"
	else
		return "Catppuccin Latte"
	end
end
wezterm.on("window-config-reloaded", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	local appearance = window:get_appearance()
	local scheme = scheme_for_appearance(appearance)
	if overrides.color_scheme ~= scheme then
		overrides.color_scheme = scheme
		window:set_config_overrides(overrides)
	end
end)
local config = {
	automatically_reload_config = true,
	color_scheme = "Dracula",
	font = wezterm.font("FiraMono Nerd Font Medium"),
	font_size = 13.0,
	enable_tab_bar = false,
	audible_bell = "Disabled",
	window_decorations = "RESIZE",
	window_close_confirmation = "NeverPrompt",
	keys = {
		{
			key = "r",
			mods = "CMD",
			action = wezterm.action.DisableDefaultAssignment,
		},
	},
	window_padding = {
		left = 20,
		right = 20,
		top = 20,
		bottom = 20,
	},
	front_end = "WebGpu",
	webgpu_power_preference = "LowPower",
}
return config
