#!/usr/bin/env ruby

require 'fileutils'

BASE_DIR = ARGV[0] || '.'
BASE_TIME = Time.now - 10*60*60

Dir.glob(File.join(BASE_DIR, '**/*')).sort.each_with_index do |file, index|
  FileUtils.touch(file, mtime: BASE_TIME + index)
end
