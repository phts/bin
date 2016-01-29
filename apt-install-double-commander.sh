#!/bin/sh

# http://sourceforge.net/p/doublecmd/wiki/Download/

wget http://download.opensuse.org/repositories/home:Alexx2000/Debian_8.0/Release.key
apt-key add - < Release.key
rm Release.key

echo 'deb http://download.opensuse.org/repositories/home:/Alexx2000/Debian_8.0/ /' >> /etc/apt/sources.list.d/doublecmd-gtk.list
apt-get update
apt-get install doublecmd-gtk
