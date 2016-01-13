#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: ${0##*/} <MOUSE_ID> <KEYBOARD_ID>"
  echo "Disable user input and turn off monitor while TeamViewer session is running. This is a missing feature of TeamViewer for Linux since only TeamViewer for Windows has it."
  echo "It requires root privileges."
  echo
  echo "Hint: use \`xinput list\` to get ids of your devices."
  exit 1
fi

MOUSE_ID=$1
KEYBOARD_ID=$2

xinput --set-prop $MOUSE_ID "Device Enabled" "0"
xinput --set-prop $KEYBOARD_ID "Device Enabled" "0"
vbetool dpms off

while true;
do
  if [[ -z `ps cax | grep TeamViewer_Desk` ]]; then
    break
  fi
  sleep 5
done

xflock4
vbetool dpms on
xinput --set-prop $MOUSE_ID "Device Enabled" "1"
xinput --set-prop $KEYBOARD_ID "Device Enabled" "1"
