#!/bin/sh

# Prints all batteries, their percentage remaining and an emoji corresponding
# to charge status (🔌 for plugged up, 🔋 for discharging on battery, etc.).

case $BLOCK_BUTTON in
	3) notify-send "🔋 Battery module" "🔋: discharging
🛑: not charging
♻: stagnant charge
🔌: charging
⚡: charged
❗: battery very low!
- Scroll to change adjust xbacklight." ;;
	4) xbacklight -inc 10 ;;
	5) xbacklight -dec 10 ;;
	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

# Loop through all attached batteries and format the info
for battery in /sys/class/power_supply/BAT?*; do
	# If non-first battery, print a space separator.
	[ -n "${capacity+x}" ] && printf " "

	# Sets up the status and capacity
	case "$(cat "$battery/status" 2>&1)" in
		"Full") status="⚡" ;;
		"Discharging") status="🔋" ;;
		"Charging") status="🔌" ;;
		"Not charging") status="🛑" ;;
		"Unknown") status="♻️" ;;
		*) exit 1 ;;
	esac

	# capacity = capacity_now / charge_full_design -> which shows only ~88% max
	#capacity="$(cat "$battery/capacity" 2>&1)"
	# So We'll calculate capacity in different way = capacity_now / capacity_full
	charge_current="$(cat "$battery/charge_now")"
	charge_full="$(cat "$battery/charge_full")"
	let "capacity=100*$charge_current/$charge_full"

	# Will make a warn variable if discharging and low
	#[ "$status" = "🔋" ] && [ "$capacity" -le 25 ] && warn="❗"
	[ "$status" = "🔋" ] && [ "$capacity" -le 25 ] && warn="!"

	# Prints the info
	if [[ "$status" = "🔋" ]] && [ "$capacity" -le 10 ] 
	then
	    # critical
	    printf "\x12%s%s%d%%" "$status" "$warn" "$capacity"; unset warn
	elif [[ "$status" = "🔋" ]] && [ "$capacity" -le 25 ] 
	then
	    # warning
	    printf "\x11%s%s%d%%" "$status" "$warn" "$capacity"; unset warn
	else
	    # normal
	    printf "\x0f%s%s%d%%" "$status" "$warn" "$capacity"; unset warn
	fi
done && printf "\\n"
