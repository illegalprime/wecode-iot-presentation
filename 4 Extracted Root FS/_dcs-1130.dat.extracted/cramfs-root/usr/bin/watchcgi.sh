#!/bin/sh

report() {
	echo -ne "\033[6A\033[J\r\
vcd:  $(pidof vcd)
acd:  $(pidof acd)
ACVS.cgi: $(pidof ACVS.cgi)
ACAS.cgi: $(pidof ACAS.cgi)
mjpg.cgi: $(pidof mjpg.cgi)
speaker.cgi: $(pidof speaker.cgi)
"
}

interval=$1
[ "$interval" != "" ] || interval=1
echo -ne "\n\n\n\n\n\n"
report
while sleep $interval; do
	report
done
