local wezterm = require("wezterm")

function recompute_line_height(window)
	local window_dims = window:get_dimensions()
	local height = window_dims.pixel_height
	local overrides = window:get_config_overrides() or {}

	overrides.line_height = 1.0 -- dynamically set
	window:set_config_overrides(overrides)
end

wezterm.on("window-resized", function(window, _)
	recompute_line_height(window)
end)

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
		local ansicolors = wezterm.color.get_builtin_schemes()[scheme]
		overrides.colors = {
			split = ansicolors.ansi[2],
		}
		window:set_config_overrides(overrides)
	end
end)
local config = {
	automatically_reload_config = true,
	font = wezterm.font("FiraMono Nerd Font", { weight = "Medium" }),
	font_size = 13.5,
	enable_tab_bar = false,
	audible_bell = "Disabled",
	window_decorations = "RESIZE|MACOS_FORCE_DISABLE_SHADOW",
	window_close_confirmation = "NeverPrompt",
	max_fps = 120,
	keys = {
		{
			key = "r",
			mods = "CMD",
			action = wezterm.action.DisableDefaultAssignment,
		},
	},
	window_padding = {
		left = "1cell",
		right = "1cell",
		top = "0.5cell",
		bottom = "0.5cell",
	},
	front_end = "WebGpu",
	webgpu_power_preference = "LowPower",
}
return config
