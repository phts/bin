#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <file>..."
    exit 1
fi

set -ex

git update-index --add --chmod=+x $*
