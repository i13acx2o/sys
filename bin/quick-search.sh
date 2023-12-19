#!/bin/zsh

# Get input from rofi
search_term=$(echo "" | rofi -dmenu -p "" -config ~/.config/rofi/simple.rasi)

# Check if the search term is not empty
if [ -n "$search_term" ]; then
    # Execute the query
    firefox -private-window "https://www.google.com/search?q=$search_term"
fi

