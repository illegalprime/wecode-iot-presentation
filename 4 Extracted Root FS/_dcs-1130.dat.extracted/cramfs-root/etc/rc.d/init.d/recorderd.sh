#!/bin/sh

daemon=recorderd
writer_daemon=recorder_writer
PATH=$PATH:/sbin

die() {
	echo $@
	exit 1
}

showUsage() {
	die "$0 {start|stop|restart|status} [prefix]"
}

dumpProfileKeys() {
	echo -n "
Codec_byte
Scale_byte
"
}

start() {
	! pids=$(pidof $daemon) || die "$daemon($pids) is already running."
	echo -n "Startting $daemon... "
	[ -x $binary ] || die "$binary is not a valid application"

	if [ "$(tdb get Record Enable_byte)" -eq 0 ]; then
		echo "disabled."
	else
		export LD_LIBRARY_PATH=$prefix/lib
		( sleep 10 && $binary > /dev/null 2> /dev/null &) &
		echo "ok."
	fi
}

status() {
	echo -n "$daemon"
	pids=$(pidof $daemon) && echo "($pids) is running." || echo " is stop."
}

stop() {
	pids=$(pidof $daemon) || { echo "$daemon is not running." && return 1; }
	echo -n "Stopping $daemon... "
	send_cmd recorderd 312
	sleep 5
	kill $(echo $pids | cut -d' ' -f1)
	sleep 1
	pids=$(pidof $daemon) && killall -9 $daemon && sleep 1 && pids=$(pidof $daemon) && die "ng." || echo "ok."
	pids=$(pidof $writer_daemon) && killall -9 $writer_daemon && sleep 1 && pids=$(pidof $writer_daemon) && die "ng." || echo "ok."
	send_cmd eventd 11 0 1
}

action=$1
prefix=$2
end=$3

[ "$end" = "" ] && [ "$action" != "" ] || showUsage
[ "$prefix" = "" ] || [ -d "$prefix" ] || die "$prefix is not a valid directory"

conf=$prefix/etc/$daemon.conf
binary=$prefix/sbin/$daemon

case $action in
	start)
		start
	;;
	stop)
		# stop may call return, instead of exit
		stop || exit 1
	;;
	restart)
		stop
		start
	;;
	status)
		status
	;;
	*)
		showUsage
	;;
esac

exit 0
