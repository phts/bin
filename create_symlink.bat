set target=%~1
set src=%~2

for %%* in ("%src%") do set filename=%%~nx*

if exist "%src%\*" (
  mklink /D "%target%%filename%" "%src%"
) else (
  mklink "%target%%filename%" "%src%"
)
