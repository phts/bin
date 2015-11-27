#!/bin/sh

sudo apt-get install bash-completion

printf "if [ -f /etc/bash_completion ]; then\n\
 . /etc/bash_completion\n\
fi" > ~/.bash_profile
