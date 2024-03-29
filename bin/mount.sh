#!/bin/zsh

uid=$(id -u)
gid=$(id -g)

usbdev=$(ls -l /sys/dev/block/ | awk -F"/" '($6~"usb" && $14~"sd") {print "/dev/" $14}')

if [ "$usbdev" ]
then
    selected=$( \
        lsblk -rno size,name,mountpoint $usbdev | \
        awk '{printf "%s%8s%12s\n", $2, $1, $3}' | \
        rofi -dmenu -l 5 -i -p "USB Drives: " | awk '{print $1}' \
    )

    if grep -qs $selected /proc/mounts
    then
        sync
        doas umount /dev/$selected
        grep -qs /mnt/$selected /proc/mounts || doas rm -rf /mnt/$selected
    else
        [ ! -d /mnt/$selected ] && doas mkdir /mnt/$selected
        doas mount -o uid=$uid,gid=$gid /dev/$selected /mnt/$selected
    fi
else
    echo "No drives connected" | rofi -dmenu -i -p "USB Drives: "
    exit
fi
