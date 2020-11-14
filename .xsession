#!/bin/sh

# Load Xresources
if [ -f "${HOME}/.Xresources" ]; then
    xrdb -merge "${HOME}/.Xresources" 
fi

# Start i3
i3
