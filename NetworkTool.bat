@echo off
mode 32,21
title Network States
echo  Loading Network information...
timeout /t 1 >nul
:loop
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "SSID" ^| findstr /v "BSSID"') do set ssid=%%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "Descripton"') do set adapter=%%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "State"') do set state=%%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "Signal"') do set signal=%%a
for /f "tokens=4 delims==" %%a in ('ping -n 2 8.8.8.8 ^| find "Average"') do set ping=%%a
for /f "tokens=4 delims " %%a in ('natstat -e ^| find "Bytes"') do set rbytes=%%a
for /f "tokens=4 delims " %%a in ('natstat -e ^| find "Bytes"') do set sbytes=%%a
cls
echo.
echo  Network:
echo  --------
echo  SSID: %ssid%
echo  NIC: %adapter%
echo  State: %state%
echo  Signal: %signal%
echo.
echo  Speed:
echo  ------
echo  Ping: %ping%
echo  Received: %rbytes%
echo  Received: %sbytes%

goto loop