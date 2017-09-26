#!/bin/bash

# Truncate some current log file
> /var/log/messages
> /var/log/syslog
> /var/log/user.log

# Remove archived log files
rm /var/log/*.0
rm /var/log/*.1
rm /var/log/*.gz
rm /var/log/*.old

# Resilio Sync journal files
rm /var/lib/resilio-sync/*.journal
rm /var/lib/resilio-sync/*.journal.zip
