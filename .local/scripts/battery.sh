#!/bin/bash

batteries=$(upower -e | grep battery)

for battery in $batteries; do
    state=$(upower -i $battery | grep state | awk -F: '{print $2}' | tr -d ' \t')
    case "X$state" in
	Xcharging)
		delay=$(upower -i $battery | grep "time to full" | awk -F: '{print $2}' | sed -e 's/^\s\+//;')
		text="AC"
		icon="🔌"
		;;
	Xpending-charge)
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
	printf '{"text":"%s %s %s","tooltip":"%s\\n%s"}' "$icon" "$percent" "$delay" "$rate" "$state"
done
