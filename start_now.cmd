@echo off
pushd "%~dp0"
cd system
start "zapret t.me/immalware" "winws.exe" ^
--wf-tcp=80,443 --wf-udp=443,50000-50100 ^
--filter-udp=443 --hostlist="..\autohosts.txt" --hostlist-exclude="..\ignore.txt" --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic="quic_initial_www_google_com.bin" --new ^
--filter-udp=50000-50100 --filter-l7=discord,stun --dpi-desync=fake --dpi-desync-repeats=6 --new ^
--filter-tcp=80 --hostlist-auto="..\autohosts.txt" --hostlist-exclude="..\ignore.txt" --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new ^
--filter-tcp=443 --hostlist-auto="..\autohosts.txt" --hostlist-exclude="..\ignore.txt" --dpi-desync=fake,split --dpi-desync-autottl=5 --dpi-desync-repeats=6 --dpi-desync-fooling=badseq --dpi-desync-fake-tls="tls_clienthello_www_google_com.bin"