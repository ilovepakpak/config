#!/bin/sh
#Status barloop
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
pidof ibus-daemon > /dev/null || ibus-daemon -drx
while true; do
	xsetroot -name "MEM: $(free | grep Mem | awk '{print $3/($2) * 100.0}')% | CPU: $(ps -A -o pcpu | tail -n+2 | paste -sd+ | bc)/400.0 | Online | Freeze | $(cat /sys/class/power_supply/BAT0/capacity)% | $(cat /sys/class/power_supply/BAT0/status) | $(date)"
	sleep 1s
done &
picom --animations --animation-for-open-window fly-in -b &
picom --experimental-backends -b &
autocutsel -fork &
picom -f &
nitrogen --restore &
exec dwm
