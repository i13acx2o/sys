#!/bin/sh

# List the options
options="Builtin\nExternal\nMirror\nExtend"
choice=$(echo $options | rofi -dmenu -i -p "Monitor")

# Execution
case "$choice" in
    "Builtin")
	xrandr --output eDP-1 --mode 1920x1080 --output DP-2 --off ;;
    "External")
	xrandr --output DP-2 --mode 1920x1080 --output eDP-1 --off ;;
    "Mirror")
	xrandr --output DP-2 --mode 1920x1080 --output eDP-1 --mode 1920x1080 --same-as DP-2 ;;
    "Extend")
	xrandr --output DP-2 --mode 1920x1080 --output eDP-1 --mode 1920x1080 --right-of DP-2 ;;
    *)
        echo "Invalid option. Exiting." ;;
esac
