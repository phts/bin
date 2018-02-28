#!/usr/bin/env bash

echo "\
[Desktop Entry]
Name=Firefox
Comment=Web Browser
GenericName=Web Browser
Exec=firefox
Categories=Internet;Network;WebBrowser;
Icon=/opt/firefox/browser/icons/mozicon128.png
Terminal=false
Type=Application
MimeType=text/html;\
text/xml;\
application/xhtml+xml;\
application/xml;\
application/vnd.mozilla.xul+xml;\
application/rss+xml;\
application/rdf+xml;\
x-scheme-handler/http;\
x-scheme-handler/https;\
" > ~/.local/share/applications/firefox.desktop

sudo ln -s /opt/firefox/firefox /usr/local/bin/

sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /opt/firefox/firefox 200
sudo update-alternatives --set x-www-browser /opt/firefox/firefox
