#!/bin/bash

case "$1" in
  'start') swaymsg "output * adaptive_sync on" && swaymsg "output * mode 3840x1600@119.982Hz" ;;
  'end')   swaymsg "output * adaptive_sync off" && swaymsg "output * mode 3840x1600@74.977Hz" ;;
  *) echo 'Requires start or end as a parameter'
esac
