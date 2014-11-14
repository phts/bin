#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage: $0 <branch_name> <file>..."
    exit 1
fi

branch=$1
shift

set -ex

git reset HEAD -- $*
git checkout $branch -- $*
