#!/usr/bin/env ruby

SLEEP_INTERVAL = 60
XSCREENSAVER_DEACTIVATE = 'xscreensaver-command -deactivate >&- 2>&-'
XSCREENSAVER_WATCH = 'xscreensaver-command -watch'

Thread.fork do
  loop do
    system(XSCREENSAVER_DEACTIVATE)
    sleep SLEEP_INTERVAL
  end
end

IO.popen(XSCREENSAVER_WATCH).each do |line|
  line = line.chomp
  if line['LOCK']
    puts 'Locked by user. Exiting...'
    exit
  end
end
