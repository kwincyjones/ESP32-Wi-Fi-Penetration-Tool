@ECHO off
cls
:start
echo.
echo 1. Generate Flipper Zero Wifi Devboard (ESP32-S2) Release 
echo 2. Generate Generic ESP32 Release
set /p choice=Type the number for the release you would like to generate: 
if '%choice%'=='' echo "%choice%" is not a valid option please choose either 1 or 2
if '%choice%'=='1' goto DevBoard
if '%choice%'=='2' goto Generic
echo.
goto start

:DevBoard
echo Generating a Flipper Zero Wifi Devboard (ESP32-S2) Release 
for %%h in (ESP32-S2-FlipperZeroWifiDevBoard-Linux ESP32-S2-FlipperZeroWifiDevBoard-Mac ESP32-S2-FlipperZeroWifiDevBoard-Windows) do (
copy /Y .\build\bootloader\bootloader.bin .\Release\Generated\%%h\FW\
copy /Y .\build\partition_table\partition-table.bin .\Release\Generated\%%h\FW\
copy /Y .\build\esp32-wifi-penetration-tool.bin .\Release\Generated\%%h\FW\
)
goto end

:Generic
echo Generating a Generic ESP32 Release
for %%h in (ESP32-Generic-Linux ESP32-Generic-Mac ESP32-Generic-Windows) do (
copy /Y .\build\bootloader\bootloader.bin .\Release\Generated\%%h\FW\
copy /Y .\build\partition_table\partition-table.bin .\Release\Generated\%%h\FW\
copy /Y .\build\esp32-wifi-penetration-tool.bin .\Release\Generated\%%h\FW\
)
goto end

:end
echo Release generated
pause
exit