#!/bin/sh

case $1 in
  screen) grim - | wl-copy && wl-paste >  ~/Pictures/Screenshots/screenshot-$(date +"%Y-%m-%d-%H-%M-%S").png;;
  region) grim -g "$(slurp)" - | wl-copy && wl-paste >  ~/Pictures/Screenshots/screenshot-$(date +"%Y-%m-%d-%H-%M-%S").png ;;
  window) grim -g "$(
    swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp
  )" - | wl-copy && wl-paste >  ~/Pictures/Screenshots/screenshot-$(date +"%Y-%m-%d-%H-%M-%S").png;;
esac

# source: https://github.com/ziap/dotfiles/tree/master/.config/sway
