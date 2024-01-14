#!/bin/zsh

# Script to connect to bluetooth devices using rofi -dmenu
device_name=$(bluetoothctl devices | sed -n 's/^Device [^ ]* //p' | rofi -dmenu -o -p "Devices")
device_id=$(bluetoothctl devices | grep "$device_name" | awk '{print $2}')

[ -z "$device_id" ] && exit 1
case "$(printf "Connect\nDisconnect\n" | rofi -dmenu -i -p 'Action: ')" in
    'Disconnect') bluetoothctl disconnect $device_id && notify-send "⭕ Disconnected Succesfully" ;;
    'Connect') bluetoothctl connect $device_id && notify-send "🎧 Connected Succesfully";;
esac
