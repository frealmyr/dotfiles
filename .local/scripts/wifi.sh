#!/bin/bash

# Show battery status.  If first argument is "ns", then use
# notify-send instead of echo.

PATH=/usr/bin:/bin

VALUE_COLOR=${color:-$(xrescat i3xrocks.value.color "#D8DEE9")}
VALUE_FONT=${font:-$(xrescat i3xrocks.value.font "Source Code Pro Medium 13")}

wifi_status=$(nmcli -t -f IN-USE,SSID,RATE,SIGNAL,BARS device wifi | awk '/^\*/')
SSID=$(echo $wifi_status | awk -F ':' '{print $2}')
RATE=$(echo $wifi_status | awk -F ':' '{print $3}' | tr -d ' ')
SIGNAL=$(echo $wifi_status | awk -F ':' '{print $4"%"}')
BARS=$(echo $wifi_status | awk -F ':' '{print $5}')

echo "<span font_desc=\"${VALUE_FONT}\" color=\"${VALUE_COLOR}\">$BARS $SSID ($SIGNAL $RATE)</span>"
