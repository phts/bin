rem %0 contains the full path to the called .bat file
rem ~dp says to get the drive and path, including trailing \

ruby "%~dp0missing-files-in-sequence.rb" %1 %2 %3 %4
pause
