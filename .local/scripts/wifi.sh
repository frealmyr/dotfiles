#!/bin/bash

# Show battery status.  If first argument is "ns", then use
# notify-send instead of echo.

PATH=/usr/bin:/bin

wifi_status=$(nmcli -t -f IN-USE,SSID,RATE,SIGNAL,BARS device wifi | awk '/^\*/')
SSID=$(echo $wifi_status | awk -F ':' '{print $2}')
RATE=$(echo $wifi_status | awk -F ':' '{print $3}' | tr -d ' ')
SIGNAL=$(echo $wifi_status | awk -F ':' '{print $4"%"}' | tr -d '%')
BARS=$(echo $wifi_status | awk -F ':' '{print $5}')

if (( SIGNAL < 75 )); then
    output='{"state":"Good", "text": "'$SSID' '$BARS' @ '$SIGNAL'%/'$RATE'"}'
elif (( SIGNAL < 50 )); then
    output='{"state":"Warning", "text": "'$SSID' '$BARS' @ '$SIGNAL'%/'$RATE'"}'
elif (( SIGNAL < 30 )); then
    output='{"state":"Critical", "text": "'$SSID' '$BARS' @ '$SIGNAL'%/'$RATE'"}'
else
    output='{"state":"Good", "text": "'$SSID' '$BARS' @ '$SIGNAL'%/'$RATE'"}'
fi

echo $output

