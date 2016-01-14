#!/bin/bash

if [ "$#" -eq 0 ]; then
  echo "Usage: ${0##*/} DEVICE_ID..."
  echo "Run teamviewer-disable-user-input.sh on each TeamViewer session."
  echo "It requires root privileges."
  echo
  echo "Hint: use \`xinput list\` to get ids of your devices."
  exit 1
fi

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

while true;
do
  if [[ ! -z `ps cax | grep TeamViewer_Desk` ]]; then
    $SCRIPT_DIR/teamviewer-disable-user-input.sh "$@"
  fi
  sleep 3
done
