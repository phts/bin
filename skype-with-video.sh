#!/bin/bash

# apt-get install libv4l-0:i386
LD_PRELOAD=/usr/lib/i386-linux-gnu/libv4l/v4l1compat.so skype
