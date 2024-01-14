#!/bin/zsh

# Excution
if [ "$1" = "sink_value" ]; then
    notify-send -r 1 "Volume $(wpctl get-volume @DEFAULT_SINK@ | awk -F ' ' '{print $NF}')"
elif [ "$1" = "source_value" ]; then
    notify-send -r 1 "Mic $(wpctl get-volume @DEFAULT_SOURCE@ | awk -F ' ' '{print $NF}')"
elif [ "$1" = "brightness" ]; then
    notify-send -r 2 "Brightness: $(xbacklight -get | awk -F '.' '{print $1}')"
fi
