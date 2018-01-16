#!/usr/bin/env ruby

require 'fileutils'

BASE_DIR = ARGV[0] || '.'
BASE_TIME = Time.now - 12*60*60

Dir.glob(File.join(BASE_DIR, '**/*')).sort.each_with_index do |file, index|
  mtime = BASE_TIME + index*60
  puts file, mtime
  FileUtils.touch(file, mtime: mtime)
end
