#!/bin/bash

# Set the input argument (either "dark" or "light")
MODE=$1
WEZTERM_CONFIG="$HOME/.config/wezterm/wezterm.lua"

# Debugging: Print the mode
echo "MODE is set to: ${MODE}"

if [[ "${MODE}" == "light" ]]; then
    echo "Switching to light theme"
    sed -i.bak 's|Catppuccin Mocha|Catppuccin Latte|' "$WEZTERM_CONFIG"
elif [[ "${MODE}" == "dark" ]]; then
    echo "Switching to dark theme"
    sed -i.bak 's|Catppuccin Latte|Catppuccin Mocha|' "$WEZTERM_CONFIG"
else
    echo "Invalid mode. Please specify 'dark' or 'light'."
    exit 1
fi
