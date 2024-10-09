@echo off
sc stop "ZapretService" > nul
sc delete "ZapretService"
pause