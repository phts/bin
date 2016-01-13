#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: ${0##*/} <MOUSE_ID> <KEYBOARD_ID>"
  echo "Run teamviewer-disable-user-input.sh on each TeamViewer session."
  echo "It requires root privileges."
  echo
  echo "Hint: use \`xinput list\` to get ids of your devices."
  exit 1
fi

MOUSE_ID=$1
KEYBOARD_ID=$2

while true;
do
  if [[ ! -z `ps cax | grep TeamViewer_Desk` ]]; then
    ./teamviewer-disable-user-input.sh $MOUSE_ID $KEYBOARD_ID
  fi
  sleep 3
done
