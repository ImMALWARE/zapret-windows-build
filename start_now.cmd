@echo off
pushd "%~dp0"
cd system
start "zapret t.me/immalware" "winws.exe" ^
--wf-tcp=80,443 --wf-udp=443,50000-50099 ^
--filter-tcp=80 --dpi-desync=fake,fakedsplit --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --hostlist-auto="..\autohosts.txt" --hostlist-exclude="..\ignore.txt" --new ^
--filter-tcp=443 --hostlist="..\youtube.txt" --dpi-desync=fake,multidisorder --dpi-desync-split-pos=1,midsld --dpi-desync-repeats=11 --dpi-desync-fooling=md5sig --dpi-desync-fake-tls-mod=rnd,dupsid,sni=www.google.com --new ^
--filter-tcp=443 --dpi-desync=fake,multidisorder --dpi-desync-split-pos=midsld --dpi-desync-repeats=6 --dpi-desync-fooling=badseq,md5sig --hostlist-auto="..\autohosts.txt" --hostlist-exclude="..\ignore.txt" --new ^
--filter-udp=443 --hostlist="..\youtube.txt" --dpi-desync=fake --dpi-desync-repeats=11 --dpi-desync-fake-quic="quic_initial_www_google_com.bin" --new ^
--filter-udp=443 --dpi-desync=fake --dpi-desync-repeats=11 --hostlist="..\autohosts.txt" --hostlist-exclude="..\ignore.txt" --new ^
--filter-udp=50000-50099 --filter-l7=discord,stun --dpi-desync=fake