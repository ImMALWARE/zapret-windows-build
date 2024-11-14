@echo off
pushd "%~dp0"

sc query ZapretService >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    sc stop "ZapretService"
    sc delete "ZapretService"
)
chcp 1251 > nul

set ARGS=^
--wf-tcp=80,443 --wf-udp=443,50000-50099 ^
--filter-tcp=80 --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --hostlist-auto=\"%CD%\\..\\autohosts.txt\" --new ^
--filter-tcp=443 --hostlist=\"%CD%\\..\\youtube.txt\" --dpi-desync=fake,split2 --dpi-desync-repeats=11 --dpi-desync-fooling=md5sig --dpi-desync-fake-tls=\"%CD%\\tls_clienthello_www_google_com.bin\" --new ^
--filter-tcp=80,443 --dpi-desync=fake,disorder2 --dpi-desync-repeats=6 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new ^
--filter-udp=50000-50099 --ipset=\"%CD%\\..\\discord.txt\" --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-any-protocol --dpi-desync-cutoff=n4 --new ^
--filter-udp=443 --hostlist=\"%CD%\\..\youtube.txt\" --dpi-desync=fake --dpi-desync-repeats=11 --dpi-desync-fake-quic=\"%CD%\\quic_initial_www_google_com.bin\" --new ^
--filter-udp=443 --dpi-desync=fake --dpi-desync-repeats=11

sc create "ZapretService" binPath= "\"%CD%\\winws.exe\" %ARGS%" DisplayName= "ZapretService" start= auto
sc description "ZapretService" "Цензуре нет!"
sc start "ZapretService"

echo. 
echo Zapret запущен в фоне! Вы можете закрыть эту командную строку.
echo Для остановки Zapret запустите delete_service.cmd
echo Вы можете нажать правой кнопкой на .cmd файлы -^> Отправить -^> "Рабочий стол (создать ярлык)" для удобного запуска/остановки
pause > nul