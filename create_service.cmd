@echo off
pushd "%~dp0"
chcp 1251 > nul
cscript //nologo system\elevator.vbs "system\screator.cmd"