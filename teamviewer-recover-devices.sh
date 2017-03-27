#!/bin/bash

if [ "$#" -eq 0 ]; then
  echo "Usage: ${0##*/} [--no-devices|DEVICE_ID...]"
  echo "Recover monitor and device states after interruption of teamviewer-disable-user-input.sh script."
  echo
  echo "Hint: use \`xinput list\` to get ids of your devices."
  exit 1
fi

function turn_on_monitors {
  xrandr | grep " connected " | awk '{ print$1 }' | while read monitor;
  do
    xrandr --output $monitor --brightness 1
  done
}

function turn_on_devices {
  for id in "$@"
  do
    xinput --set-prop $id "Device Enabled" "1"
  done
}

turn_on_monitors

if [ "$1" != "--no-devices" ]; then
  turn_on_devices "$@"
fi
