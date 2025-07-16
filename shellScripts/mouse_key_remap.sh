#!/bin/bash

# Remapping my moush middle keys to left and right buttons 


# Check if running in a graphical environment
if ! command -v xinput &> /dev/null; then
    echo "xinput command not found. Exiting."
    exit 1
fi

device_id=$(xinput list | grep -i "USB OPTICAL MOUSE" | grep -o 'id=[0-9]*' | cut -d'=' -f2)

# Check if the device ID was found
if [ -z "$device_id" ]; then
    echo "USB OPTICAL MOUSE not found."
    # Optionally log this to a file
    echo "$(date): USB OPTICAL MOUSE not found." >> /var/log/mouse_setup.log
else
    # Set the button map using the found device ID
    xinput set-button-map "$device_id" 1 2 3 4 5 6 7 3 1
fi
