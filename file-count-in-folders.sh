#!/bin/bash
# http://stackoverflow.com/questions/15216370/how-to-count-number-of-files-in-each-directory

find . -type d -print0 | while read -d '' -r dir; do
    files=("$dir"/*)
    file_count_in_dir=${#files[@]}
    printf "%5d files in directory %s\n" "$file_count_in_dir" "$dir"
done
