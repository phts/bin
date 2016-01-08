#!/usr/bin/ruby

total = 0
(Dir.entries(Dir.pwd) - ['.', '..']).each do |dir|
  files = Dir.glob(File.join(dir, '**', '*')).reject{|p| File.directory?(p) }
  file_count_in_dir = files.count
  total += file_count_in_dir
  printf("%5d files in %s\n", file_count_in_dir, dir)
end

printf("%5d files total\n", total)
