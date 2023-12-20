#!/bin/zsh

# List the options
menu="Builtin\nExternal\nMirror\nExtend"
choice=$(echo $menu | rofi -dmenu -i -p "Monitor")

# Execution
case "$choice" in
    "Builtin")
	xrandr --output eDP1 --mode 1920x1080 --output DP2 --off
	;;
    "External")
	xrandr --output DP2 --mode 1920x1080 --output eDP1 --off
	;;
    "Mirror")
	xrandr --output DP2 --mode 1920x1080 --output eDP1 --mode 1920x1080 --same-as DP2
	;;
    "Extend")
	xrandr --output DP2 --mode 1920x1080 --output eDP1 --mode 1920x1080 --right-of DP2
	;;
    *)
        echo "Invalid option. Exiting."
	;;
esac
