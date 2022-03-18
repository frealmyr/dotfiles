#!/bin/bash

# Show battery status.  If first argument is "ns", then use
# notify-send instead of echo.

PATH=/usr/bin:/bin

batteries=$(upower -e | grep battery)

for battery in $batteries; do
    state=$(upower -i $battery | grep state | awk -F: '{print $2}' | tr -d ' \t')
    case "X$state" in
	Xcharging)
		delay=$(upower -i $battery | grep "time to full" | awk -F: '{print $2}' | sed -e 's/^\s\+//;' | tr -d ' ')
		power_state="charging"
        ;;
	Xdischarging)
		delay=$(upower -i $battery | grep "time to empty" | awk -F: '{print $2}' | sed -e 's/^\s\+//;' | tr -d ' ')
		power_state="discharging"
		;;
	Xpending-charge)
		delay=$(upower -i $battery | grep "time to empty" | awk -F: '{print $2}' | sed -e 's/^\s\+//;' | tr -d ' ')
		power_state="pending_charge"
		;;
	*)
		delay='??'
		power_state=$state
		;;
    esac

  percent=$(upower -i $battery | grep percentage | awk -F: '{print $2}' | tr -d ' \t' | tr -d '%')
	rate=$(upower -i $battery | grep energy-rate | awk -F: '{print $2}' | tr -d ' \t' )

	if [[ $power_state == charging ]]; then
		output='{"icon":"'bat_charging'","state":"Good", "text": "'$percent'% ('$delay') @ '$rate'"}'
	elif [[ $power_state == pending_charge ]]; then
		output='{"icon":"'bat_charging'","state":"Good", "text": "Fully charged '$percent'%"}'
	elif [[ $power_state == discharging ]]; then
		if (( percent > 76 )); then
			output='{"icon":"'bat_full'","state":"Info", "text": "'$percent'% ('$delay') @ '$rate'"}'
		elif (( percent < 76 )); then
			output='{"icon":"'bat_three_quarters'","state":"Info", "text": "'$percent'% ('$delay') @ '$rate'"}'
		elif (( percent < 51 )); then
			output='{"icon":"'bat_half'","state":"Warning", "text": "'$percent'% ('$delay') @ '$rate'"}'
		elif (( percent < 26 )); then
			output='{"icon":"'bat_quarter'","state":"Critical", "text": "'$percent'% ('$delay') @ '$rate'"}'
		else
			output='{"icon":"'bat_empty'","state":"Critical", "text": "'$percent'% ('$delay') @ '$rate'"}'
		fi
	else
		output='{"icon":"'bat_not_available'","state":"Critical", "text": "'$power_state'"}'
	fi

	echo $output
done
