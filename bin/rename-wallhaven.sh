#!/bin/bash

# Directory where your files are stored
FILES_DIR="$HOME/media/wallpapers"

# Navigate to the directory containing the files
cd "$FILES_DIR" || exit

# Rename files matching the pattern
rename 's/wallhaven-(.*)_.*\.png/$1.png/' wallhaven-*.png
