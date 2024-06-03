#!/bin/bash

# Set the input argument (either "dark" or "light")
MODE=$1
ALACRITTY_CONFIG="$HOME/.config/alacritty/alacritty.toml"

# Debugging: Print the mode
echo "MODE is set to: ${MODE}"

if [[ "${MODE}" == "light" ]]; then
    echo "Switching to light theme"
    sed -i.bak 's|dark.toml|light.toml|' "$ALACRITTY_CONFIG"
elif [[ "${MODE}" == "dark" ]]; then
    echo "Switching to dark theme"
    sed -i.bak 's|light.toml|dark.toml|' "$ALACRITTY_CONFIG"
else
    echo "Invalid mode. Please specify 'dark' or 'light'."
    exit 1
fi
