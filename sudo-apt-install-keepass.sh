sudo apt-get install keepass2

# KeePassHttp
# https://github.com/pfn/keepasshttp/
cd $HOME
wget https://raw.github.com/pfn/keepasshttp/master/KeePassHttp.plgx
mkdir -p /usr/lib/keepass2/Plugins
sudo mv KeePassHttp.plgx /usr/lib/keepass2/Plugins
apt-get install libmono-system-xml-linq4.0-cil \
                libmono-system-data-datasetextensions4.0-cil \
                libmono-system-runtime-serialization4.0-cil \
                mono-mcs

# Enable auto-type
# sudo apt-get install xdotool

# KeePassHttp alternative install:
# apt-add-repository ppa:dlech/keepass2-plugins
# apt-get update
# apt-get install keepass2-plugin-keepasshttp
