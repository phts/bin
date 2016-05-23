#!/usr/bin/env ruby

if ARGV.size != 4
  puts <<-USAGE
Usage: missing-files-in-sequence.rb MASK FROM_NUMBER TO_NUMBER PADDING
       MASK should contain '#' symbol as a replacement of a number sequence, for example myfile#.txt
USAGE
  exit 1
end

mask = ARGV[0]
from_raw = ARGV[1]
from = from_raw.to_i
to_raw = ARGV[2]
to = to_raw.to_i
padding = ARGV[3].to_i
sprintf_format = mask.gsub('#', "%0#{padding}d")

(from..to).each do |num|
  filename = sprintf(sprintf_format, num)
  unless File.exists?(filename)
    puts(filename)
  end
end
