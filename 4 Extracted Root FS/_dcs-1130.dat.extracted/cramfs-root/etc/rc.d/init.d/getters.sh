#!/bin/sh

die() {
	echo $@
	exit 1
}

showUsage() {
	die "$0 {start|stop|restart|status} [prefix]"
}

# start order
# recorderd, snapshotd -> eventd -> watchDog, motiond
# recorderd, snapshotd, watchDog, motiond -> scheduled
start() {
	echo start services, ...
	$prefix/etc/rc.d/init.d/recorderd.sh start $prefix
	$prefix/etc/rc.d/init.d/snapshotd.sh start $prefix
	$prefix/etc/rc.d/init.d/rtpd.sh start $prefix
	$prefix/etc/rc.d/init.d/rtspd.sh start $prefix
	$prefix/etc/rc.d/init.d/motiond.sh start $prefix
	if [ "$(pibinfo HWBoard 2> /dev/null)" = "cas675" ]; then
	    $prefix/etc/rc.d/init.d/ird.sh start $prefix
	fi
}

status() {
	echo status of services, ...
	$prefix/etc/rc.d/init.d/recorderd.sh status $prefix
	$prefix/etc/rc.d/init.d/snapshotd.sh status $prefix
	$prefix/etc/rc.d/init.d/rtpd.sh status $prefix
	$prefix/etc/rc.d/init.d/rtspd.sh status $prefix
	$prefix/etc/rc.d/init.d/motiond.sh status $prefix
	if [ "$(pibinfo HWBoard 2> /dev/null)" = "cas675" ]; then
	    $prefix/etc/rc.d/init.d/ird.sh status $prefix
	fi
}

stop() {
	echo stop services, ...
	if [ "$(pibinfo HWBoard 2> /dev/null)" = "cas675" ]; then
	    $prefix/etc/rc.d/init.d/ird.sh stop $prefix
	fi
	$prefix/etc/rc.d/init.d/motiond.sh stop $prefix
	$prefix/etc/rc.d/init.d/rtspd.sh stop $prefix
	$prefix/etc/rc.d/init.d/rtpd.sh stop $prefix
	$prefix/etc/rc.d/init.d/snapshotd.sh stop $prefix
	$prefix/etc/rc.d/init.d/recorderd.sh stop $prefix
}

action=$1
prefix=$2
end=$3

[ "$end" = "" ] && [ "$action" != "" ] || showUsage
[ "$prefix" = "" ] || [ -d "$prefix" ] || die "$prefix is not a valid directory"

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
