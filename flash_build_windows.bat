@echo off 
echo #########################################
echo # ESP32S2 Wifi Penetration Tool Flasher #
echo #             By Frog                   #
echo #########################################
echo.
:: This script is meant for quickly flashing build during Development 
:: It will not work if you do not have the ESPTOOL in your project folder or in your PATH
set /p COMINPUT=Please enter the COM port your Wifi Dev Board (ESP32-S2) is connected on for example "COM7":
echo Starting flashing on %COMINPUT%
esptool.exe -p %COMINPUT% -b 115200 --after no_reset write_flash --flash_mode dio --flash_freq 40m --flash_size=keep 0x8000 ./build/partition_table/partition-table.bin 0x1000 ./build/bootloader/bootloader.bin 0x10000 ./build/esp32-wifi-penetration-tool.bin
echo Flashing has completed please press the reset button on your Flipper Zero Wifi Dev Board
pause