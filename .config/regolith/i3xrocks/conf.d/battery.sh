#!/bin/bash

# Show battery status.  If first argument is "ns", then use
# notify-send instead of echo.

PATH=/usr/bin:/bin

batteries=$(upower -e | grep battery)
# Normally I have only one battery, but watch out for multiple entries
# some day.
for battery in $batteries; do
    state=$(upower -i $battery | grep state | awk -F: '{print $2}' | tr -d ' \t')
    case "X$state" in
	Xcharging)
	  	delay=$(upower -i $battery | grep "time to full" | awk -F: '{print $2}' | sed -e 's/^\s\+//;')
			icon="🔌"
            ;;
	Xdischarging)
	    delay=$(upower -i $battery | grep "time to empty" | awk -F: '{print $2}' | sed -e 's/^\s\+//;')
			icon="🔋"
	    ;;
	*)
	    delay='??'
	    percent='--'
	    ;;
    esac
    percent=$(upower -i $battery | grep percent | awk -F: '{print $2}' | tr -d ' \t')
		rate=$(upower -i $battery | grep energy-rate | awk -F: '{print $2}' | tr -d ' \t')
    if [ "X$1" = Xns ]; then
	# Include the time, because often I use this in full-screen
	# mode precisely because I can't see the i3 bar.
	date_string=$(date "+%Y-%m-%d \t  %R \t %z   %Z   (%A)")
	notify-send "$state ($delay, $percent)" "$(echo; echo $date_string)"
    else
	echo "$icon $state ($rate - $percent - $delay)"
    fi
done
