#!/bin/sh

# Directory where your wallpapers are stored
WALLPAPER_DIR="$HOME/media/wallpapers"

# Get a random wallpaper from the directory
random_wallpaper=$(find "$WALLPAPER_DIR" -type f -name '*.png' -o -name '*.jpg' -o -name '*.jpeg' | shuf -n 1)

# Set the selected wallpaper using xwallpaper
xwallpaper --stretch "$random_wallpaper"
