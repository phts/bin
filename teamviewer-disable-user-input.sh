#!/bin/bash

if [ "$#" -eq 0 ]; then
  echo "Usage: ${0##*/} DEVICE_ID..."
  echo "Disable user input and turn off monitor while TeamViewer session is running. This is a missing feature of TeamViewer for Linux since only TeamViewer for Windows has it."
  echo "It requires root privileges."
  echo
  echo "Hint: use \`xinput list\` to get ids of your devices."
  exit 1
fi

for id in "$@"
do
  xinput --set-prop $id "Device Enabled" "0"
done
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
for id in "$@"
do
  xinput --set-prop $id "Device Enabled" "1"
done
