#!/bin/zsh

# List the options
menu=("Shutdown\nReboot\nHibernate\nSuspend\nLock\nExit")
choice=$(echo $menu | rofi -dmenu -i -p "$(hostname)")

# Execution
case $choice in
    "Shutdown")
        doas poweroff
	;;
    "Reboot")
        doas reboot
	;;
    "Hibernate")
        doas ZZZ
	;;
    "Suspend")
        doas zzz
	;;
    "Lock")
        exit 1
	;;
    "Exit")
        pkill bspwm
	;;
    *)
	exit 1
	;;
esac
