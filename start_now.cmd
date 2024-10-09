@echo off
pushd "%~dp0"
cd system
dir
start "zapret: websites" "winws.exe" ^
--wf-tcp=80,443 --wf-udp=443-65535 ^
--filter-udp=443 --hostlist="..\websites.txt" --dpi-desync=fake --dpi-desync-repeats=11 --dpi-desync-fake-quic="quic_initial_www_google_com.bin" --new ^
--filter-udp=50000-65535 --dpi-desync=fake,tamper --dpi-desync-any-protocol --dpi-desync-fake-quic="quic_initial_www_google_com.bin" --new ^
--filter-tcp=443 --hostlist="..\websites.txt" --dpi-desync=fake,split2 --dpi-desync-fooling=badseq --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --dpi-desync-fake-tls="tls_clienthello_www_google_com.bin" --new ^
--dpi-desync=disorder2 --new