#!/bin/bash

# Show battery status.  If first argument is "ns", then use
# notify-send instead of echo.

PATH=/usr/bin:/bin

LABEL_ICON=${icon:-$(xrescat i3xrocks.label.time )}
LABEL_COLOR=${label_color:-$(xrescat i3xrocks.label.color "#7B8394")}
VALUE_COLOR=${color:-$(xrescat i3xrocks.value.color "#D8DEE9")}
VALUE_FONT=${font:-$(xrescat i3xrocks.value.font "Source Code Pro Medium 13")}

batteries=$(upower -e | grep battery)
# Normally I have only one battery, but watch out for multiple entries
# some day.
for battery in $batteries; do
    state=$(upower -i $battery | grep state | awk -F: '{print $2}' | tr -d ' \t')
    case "X$state" in
	Xcharging)
	  	delay=$(upower -i $battery | grep "time to full" | awk -F: '{print $2}' | sed -e 's/^\s\+//;')
		text="AC"
		icon="🔌"
        ;;
	Xdischarging)
	    delay=$(upower -i $battery | grep "time to empty" | awk -F: '{print $2}' | sed -e 's/^\s\+//;')
		text="BAT"
		icon="🔋"
	    ;;
	*)
	    delay='??'
	    percent='--'
	    ;;
    esac
    percent=$(upower -i $battery | grep percent | awk -F: '{print $2}' | tr -d ' \t')
	rate=$(upower -i $battery | grep energy-rate | awk -F: '{print $2}' | tr -d ' \t' )
	echo "<span font_desc=\"${VALUE_FONT}\" color=\"${LABEL_COLOR}\">$icon</span><span font_desc=\"${VALUE_FONT}\" color=\"${VALUE_COLOR}\"> $text $delay ($rate - $percent)</span>"
done
