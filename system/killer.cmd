@echo off
pushd "%~dp0"
taskkill /f /im winws.exe
sc stop "ZapretService"
sc delete "ZapretService"
sc stop windivert
sc delete windivert
pause