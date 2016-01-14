#!/bin/bash

if [ "$#" -eq 0 ]; then
  echo "Usage: ${0##*/} DEVICE_ID..."
  echo "Disable user input and turn off monitor while TeamViewer session is running. This is a missing feature of TeamViewer for Linux since only TeamViewer for Windows has it."
  echo
  echo "Hint: use \`xinput list\` to get ids of your devices."
  exit 1
fi

function turn_off_monitors {
  xrandr | grep " connected " | awk '{ print$1 }' | while read monitor;
  do
    xrandr --output $monitor --brightness 0
  done
}

function turn_on_monitors {
  xrandr | grep " connected " | awk '{ print$1 }' | while read monitor;
  do
    xrandr --output $monitor --brightness 1
  done
}

for id in "$@"
do
  xinput --set-prop $id "Device Enabled" "0"
done
turn_off_monitors

while true;
do
  if [[ -z `ps cax | grep TeamViewer_Desk` ]]; then
    break
  fi
  sleep 5
done

xflock4
turn_on_monitors
for id in "$@"
do
  xinput --set-prop $id "Device Enabled" "1"
done
