@echo off
pushd "%~dp0"

sc query ZapretService >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    sc stop "ZapretService"
    sc delete "ZapretService"
)

chcp 1251
sc create "ZapretService" binPath= "\"%CD%\winws.exe\" --wf-tcp=80,443 --wf-udp=443-65535 --filter-udp=443 --hostlist=\"%CD%\..\websites.txt\" --dpi-desync=fake --dpi-desync-repeats=11 --dpi-desync-fake-quic=\"%CD%\quic_initial_www_google_com.bin\" --new --filter-udp=50000-65535 --dpi-desync=fake,tamper --dpi-desync-any-protocol --dpi-desync-fake-quic=\"%CD%\quic_initial_www_google_com.bin\" --new --filter-tcp=443 --hostlist=\"%CD%\..\websites.txt\" --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --dpi-desync-fake-tls=\"%CD%\tls_clienthello_www_google_com.bin\" --new --dpi-desync=disorder2 --new" start= auto
sc description "ZapretService" "Цензуре нет!"
sc failure "ZapretService" reset= 0 actions= restart/60000/restart/60000/restart/60000
sc start "ZapretService"
echo. 
echo Zapret запущен в фоне! Вы можете закрыть эту командную строку.
echo Для остановки Zapret запустите delete_service.cmd
echo Вы можете нажать правой кнопкой на .cmd файлы -^> Отправить -^> "Рабочий стол (создать ярлык)" для удобного запуска/остановки
pause > nul