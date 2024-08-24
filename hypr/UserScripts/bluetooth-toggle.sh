#!/bin/bash

# Check the current Bluetooth status
BT_STATUS=$(bluetoothctl show | grep "Powered:" | awk '{print $2}')
echo "Current Bluetooth Status: $BT_STATUS" # Debug statement

if [ "$BT_STATUS" == "yes" ]; then
    # Turn off Bluetooth
    bluetoothctl power off
    notify-send "Bluetooth is OFF now"
    pkill blueman-manager
else
    # Turn on Bluetooth
    bluetoothctl power on
    notify-send "Bluetooth is ON now"
    blueman-manager
fi

